# Iron District Gym — CS 4347 Project Team 12

## Setup

**1. Install PostgreSQL**
```bash
brew install postgresql@16
brew services start postgresql@16
```

**2. Create the database**
```bash
createdb irondistrict
```

**3. Run the scripts in this order**
```bash
psql irondistrict -f create.sql
psql irondistrict -f seed.sql
```

**4. Connect pgAdmin**
- Download pgAdmin 4 from pgadmin.org
- Add New Server → General tab: name it anything
- Connection tab: Host `localhost`, Port `5432`, Database `irondistrict`, Username = your Mac username, Password blank
- Save → right-click the database → Query Tool to run SQL
