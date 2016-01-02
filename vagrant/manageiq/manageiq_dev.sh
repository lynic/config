# Configure PostgresSQL
echo "smartvm" |sudo passwd --stdin postgres 
sudo su postgres -c 'initdb -D /var/lib/pgsql/data'
sudo systemctl enable postgresql
sudo systemctl start postgresql
sudo su postgres -c "psql -c \"CREATE ROLE root SUPERUSER LOGIN PASSWORD 'smartvm'\""

#install rubyversion
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

source ~/.bash_profile

#configure ruby version
cd manageiq
echo "continuing in manageiq/"

#Configure rbenv

rbenv install 2.2.3
rbenv local 2.2.3
gem install bundler
gem install nokogiri -v '1.6.6.2'
bundle install

#Copy the development keys to place
#Security risk, don't do this in production
cp /home/vagrant/manageiq/certs/v2_key.dev  /home/vagrant/manageiq/certs/v2_key


#Configure the database
echo "Configuring the database"
cp config/database.pg.yml config/database.yml
bundle exec rake evm:db:reset
bundle exec rake db:seed

# Start the service
echo "starting the service. You can access it as 127.0.0.1:3000 admin/smartvm"
bundle exec rake evm:start
