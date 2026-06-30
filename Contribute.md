## Manual installation

-Install node js locally
-clone the repo
-install the dependencies
-stat DB locally/use a cloud DB
-docker run -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres
-Go to neon.tech/aiven.io to get your DB credentials
-Change the .env file and update your DB credentials
-npx prisma migrate
-npx prisma generate
-npm run build
-npm run dev

## Docker Installation

-Install docker
-start postgres
-docker run -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 postgres
-Build the image -`docker build -t user-project`
-Start the image -`docker run -p 3000:3000    user-project`
