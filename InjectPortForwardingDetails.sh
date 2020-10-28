#!/bin/bash

read -p 'Please enter your assigned machine name (e.g. larsofttws1): ' MACHINENAME
read -p 'and now your assigned username (e.g. larsoft1): ' USERNAME
read -p 'and finally your assigned port number (e.g. 15901): ' PORTNUMBER

read -p 'One last check.  Are the details you entered correct (check spelling and capitalisation) [y/n]:' CHECK

if [ "$CHECK" == "y" ]
  then
  DESTINATION="${HOME}/.ssh/config"
  INJECTION="Host ${MACHINENAME}\n
  HostName ${MACHINENAME}.blackett.manchester.ac.uk\n
  User ${USERNAME}\n
  LocalForward 5909 localhost:${PORTNUMBER}"
  echo "Injecting the following into ${DESTINATION}:"
  echo -e ${INJECTION}
  echo -e ${INJECTION} >> ${DESTINATION}

  else

  echo "Please run the command again and use the correct details."
fi


