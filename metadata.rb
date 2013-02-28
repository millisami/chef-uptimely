name             "uptimely"
maintainer       "Millisami"
maintainer_email "millisami@gmail.com"
license          "All rights reserved"
description      "Installs/Configures uptimely"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "nodejs"
depends "mongodb"
depends "git"
depends "nginx"

supports "ubuntu"