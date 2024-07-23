# Use the latest version of ubuntu linux as the base image
FROM ubuntu:latest

#Set the working directory inside the container
WORKDIR /app

#Copy the shell script file to the working directory
COPY wisecow.sh .

#Set execute permission for the shell script
RUN chmod +x wisecow.sh
RUN sudo apt install fortune-mod cowsay -y

#Expose the application port
EXPOSE 4499

#Start the application
CMD ["./wisecow.sh"]
