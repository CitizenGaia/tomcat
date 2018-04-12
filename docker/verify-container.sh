#!/bin/bash
if [ ! -d "$LOG_VOLUME" ]
then
  echo "You must provide a volume at path '$LOG_VOLUME'. Exiting now!"
  exit 1
fi

if [ "z$LISTEN_PORT" = "z" ]
then
  echo "You must set LISTEN_PORT. For example 8080. Exiting now!"
  exit 1
fi
