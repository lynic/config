# install packages
yum -y install git-all                            # Git and components
yum -y install memcached                          # Memcached for the session store
yum -y install postgresql-devel postgresql-server # PostgreSQL Database server and to build 'pg' Gem
yum -y install libxml2-devel libxslt-devel patch  # For Nokogiri Gem
yum -y install gcc-c++                            # For event-machine Gem
yum -y install bash-completion chrony deltarpm vim wget

# Enable Memcached
systemctl enable memcached
systemctl start memcached

# install some requisites for rbenv
yum install -y openssl-devel readline-devel

#needed for manageiq
yum install -y graphviz-devel graphviz-ruby
