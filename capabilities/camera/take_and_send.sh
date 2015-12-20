#!/bin/bash
IMAGE=`./capabilities/camera/take_picture.py --out var/images/`
dtnsend -s dtn://camerapi.dtn/camera -d dtn://sirena.dtn/images -t f -p $IMAGE
