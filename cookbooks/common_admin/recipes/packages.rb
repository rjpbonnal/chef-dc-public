#RUN apt-get update --fix-missing &&\
 #  apt-get install -y inotify-tools vim nano wget links curl rsync bc git git-core apt-transport-https libxml2 libxml2-dev libcurl4-openssl-dev openssl sqlite3 libsqlite3-dev gawk libreadline6-dev libyaml-dev autoconf 
 #libgdbm-dev libncurses5-dev automake libtool bison libffi-dev libboost-dev
package 'inotify-tools'
package 'vim'
package 'nano'
package 'wget'
package 'links'
package 'curl'
package 'rsync'
package 'bc'
package 'git'
package 'git-core'
package 'apt-transport-https'
package 'libxml2'
package 'libxml2-dev'
package 'libcurl4-openssl-dev'
package 'openssl'
package 'sqlite3'
package 'libsqlite3-dev'
package 'gawk'
package 'libreadline6-dev'
package 'libyaml-dev'
package 'autoconf'
package 'libgdbm-dev'
package 'libncurses5-dev'
package 'automake'
package 'libtool'
package 'bison'
package 'libffi-dev'
package 'libboost-dev'
package 'r-cran-snow'
package 'r-cran-caTools'
package 'python-dev'
package 'python-pip'
package 'python-numpy'
package 'libmysqlclient-dev'


#RUN apt-get update --fix-missing &&\
#   apt-get install -y r-cran-snow r-cran-caTools

#RUN apt-get update --fix-missing &&\
#   apt-get install -y python-dev python-pip python-numpy