# Assumptions:
Ubuntu
```bash
lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 22.04.3 LTS
Release:        22.04
Codename:       jammy
```
Ruby
```bash
  ruby --version
  ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x86_64-linux]
```
# PostgreSQL
```bash
sudo apt-get update
sudo apt install postgresql postgresql-contrib libpq-dev
```
Adding the user for your app
```bash
sudo -i -u postgres
psql
```
```sql
CREATE ROLE <your_username> LOGIN SUPERUSER PASSWORD '<your_password>';
# CREATE ROLE
```
# Rails
## App creation
```bash
rails new ta-backend -d=postgresql
cd ta-backend
```
## Credentials
`EDITOR=vim rails credentials:edit`

```bash
database:
username: <your_username>
password: <your_password>
```
`rails db:create db:migrate`

Update `config/database.yml` "username" field at the *default* near the end of the file