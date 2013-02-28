name             "nodeuptime"
maintainer       "YOUR_NAME"
maintainer_email "YOUR_EMAIL"
license          "All rights reserved"
description      "Installs/Configures nodeuptime"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "nodejs"
depends "mongodb"
depends "git"
depends "nginx"

supports "ubuntu"