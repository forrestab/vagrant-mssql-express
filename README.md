# vagrant-mssql-express

A Windows Server 2012 R2 VM with SQL Server Express 2014 R2 SP2 powered by Vagrant.

## Requirements

* Vagrant 1.6+ (tested on 1.7.4)
* VirtualBox 4.3+ (tested on 4.3.16 on an Ubuntu host and 5.0.4 on a Windows 10 host)
* Around `12GB` of disk space (`3GB` for base box + `~9GB` for the VM)

## Base box information

* Configured with 2 CPU and 2 GB memory by default.
* No updates or services packs applied
* The box is not activated. It has been created for testing and evaluation
  purposes only. Use of this machine for greater than 30 days will require a
  full license either via MSDN or your local Microsoft Reseller.
* The box has been created with [packer.io](http://www.packer.io/) using the
  templates made available [here](https://github.com/opentable/packer-images).

More information can be found on the [box page at Vagrant Cloud](https://atlas.hashicorp.com/opentable/boxes/win-2012r2-standard-amd64-nocm).

## Usage

```sh
git clone https://github.com/forrestab/vagrant-mssql-express.git
cd vagrant-mssql-express
# If you have any database and default values scripts you can either rename them to 
#  database_creation.sql and default_values.sql or update the create-database.ps1 powershell
#  script to use your files once the sql server has been installed.
vagrant up
# Get a coffee as it will take a while for it to finish provisioning
```

Then test the connection with the SQL Server using `telnet 192.168.50.4 1433`

### Connecting to the SQL Server instance that runs inside the VM

* IP / Host: `192.168.50.4`
* Username: `sa`
* Password: `#SAPassword!`

### Connecting to the VM using [Remote Desktop](https://en.wikipedia.org/wiki/Remote_Desktop_Protocol) connections

If you need to perform administrative tasks like importing a DB dump or creating
new databases, you can use the [`vagrant rdp` command](http://docs.vagrantup.com/v2/cli/rdp.html)
and log in with the `vagrant` user and password.

For the `vagrant rdp` command to work on Ubuntu, you'll need to `apt-get install rdesktop`
first. I'm not sure what are the dependencies on Macs since I don't own one but
if you do [please let me know](https://github.com/fgrehm/vagrant-mssql-express/issues/new)!

## More information

If you want to know more about how the provisioning process work, check out
[this blog post](http://helabs.com.br/blog/2014/09/19/mssql-on-vagrant/)

## Sponsor

This project was made possible thanks to [HE:labs](http://helabs.com.br/en)

## Resources

Here's some links I collected along the way while building this:

* http://msdn.microsoft.com/en-us/library/ms144259%28v=SQL.100%29.aspx
* http://technet.microsoft.com/en-us/library/ee176858.aspx
* http://iqbalnaved.wordpress.com/2013/09/28/configuration-for-connecting-to-mssql-server-2008-on-virtualbox-guestos-from-ubuntu-12-04-hostos-using-pyodbc-3-0-8/
* http://technet.microsoft.com/en-us/library/dd206997(v=sql.105).aspx
* http://sirsql.net/blog/2011/6/21/set-the-sql-tcpip-port-with-powershell.html
