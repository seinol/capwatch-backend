# capwatch-backend

CapWatch Backend

# Setup Visual Studio

## Import vssettings

Tools -> Import and Export Settings -> Dialog
Import selected environment settings -> Next -> No, just import new settings... -> Next -> Browse -> *select Settings File* -> Next -> Finish

## Power Commands for Visual Studio

Code autoformatting and import organizer when file saved

Extensions -> Manage Extensions -> Search *Power Commands for Visual Studio* -> Install -> restart Visual Studio

# Build and run Docker Container

docker build -t capwatch-backend-image .\
docker run -d -p 8080:80 --name capwatch-backend capwatch-backend-image
