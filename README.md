# vagrantR

main purpose of this small vagrant box is to provide you with the latest R on latest ubuntu with latest gcc toolchain 
to allow for sanitized debugging.


# how-to

change to the vagrantR directory. make sure you have some gigs of hard drive space left. then start the party with

$ vagrant up

wait. it will update the os, download latest gcc 6.x and some packages, download R sources and compile them with the proper flags. 
grab some tea. to do some work, you can simply do

$ vagrant ssh

and there you are. start your R debugging.

if you messed up, you can just 

$ vagrant destroy

to get rid of everything and then restart with vagrant up.


# thanks

this work depends on all the great stuff done by the R team, the vagrant team and so many more.
thanks and keep up the incredible work!
