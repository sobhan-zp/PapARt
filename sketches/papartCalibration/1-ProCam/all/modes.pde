boolean isCameraMode = false;
boolean isCameraKinectMode = false;
boolean isProjectorMode = false;
boolean isARCam = false;
boolean isARProj= false;
boolean areCorners = false;
boolean areProjectorCorners = false;
boolean isObjectSize = false;
boolean isSaveButtonShowed = false;
boolean isKinect3DView = false;

void cameraMode(){
    papart.forceCameraSize();
    isCameraMode = true;
    isProjectorMode = false;
}

void projectorMode(){
    // projector.automaticMode();
    papart.forceProjectorSize();
    isCameraMode = false;
    isProjectorMode = true;
}

void noMode(){
    Mode.set("None");

    if(isARCam){
        arDisplay.manualMode();
        isARCam = false;
    }

    if(isARProj){
        projector.manualMode();
        isARProj = false;
    }

    if(areCorners){
        controlFrame.hideCorners();
        areCorners = false;
    }

    if(areProjectorCorners){
        projectorCorners.getSurface().setVisible(false);
        areProjectorCorners = false;
    }

    if(isObjectSize){
        controlFrame.hideObjectSize();
        isObjectSize = false;
    }

    if(isSaveButtonShowed){
        controlFrame.hideSaveCameraButton();
        controlFrame.hideSaveProjectorButton();
        controlFrame.hideSaveKinectButton();
        isSaveButtonShowed = false;
    }

    if(isKinect3DView){
        pcv.getSurface().setVisible(false);
        isKinect3DView = false;
    }
    // areProjectorCorners = true;

    if(isCameraKinectMode){
        arDisplayKinect.manualMode();
        isCameraKinectMode = false;
    }

    isCameraMode = false;
    isProjectorMode = false;
}

public void camMode(int value){

    if(value == -1){
        noMode();
        return;
    }

    controlFrame.resetProjRadio();
    controlFrame.resetKinectRadio();
    noMode();

    if(!isCameraMode){
        cameraMode();
    }

    switch(value) {
    case 0:
        Mode.set("CamView");
        break;
    case 1:
        Mode.set("CamMarker");
        arDisplay.automaticMode();
        isARCam = true;
        controlFrame.showSaveCameraButton();
        isSaveButtonShowed = true;
        break;
    case 2:
        Mode.set("CamManual");
        activateCameraCorners();
        break;
    }
}



public void projMode(int value){
    if(value == -1){
        noMode();
        return;
    }

    controlFrame.resetCamRadio();
    controlFrame.resetKinectRadio();
    noMode();

    switch(value) {
    case 0:
        Mode.set("ProjManual");
        projectorMode();
        activateProjectorCornersObject();
        controlFrame.showSaveProjectorButton();
        isSaveButtonShowed = true;
        break;
    case 1:
        Mode.set("ProjMarker");
        cameraMode();
        activateProjectorCorners();
        controlFrame.showSaveProjectorButton();
        isSaveButtonShowed = true;
        break;
    case 2:
        Mode.set("ProjView");
        projectorMode();
        projector.automaticMode();
        isARProj = true;
        break;
    }
}

public void kinectMode(int value){
    if(value == -1){
        noMode();
        return;
    }

    controlFrame.resetCamRadio();
    controlFrame.resetProjRadio();
    noMode();

    switch(value) {
    case 0:
        Mode.set("Kinect3D");
        isKinect3DView = true;
        pcv.getSurface().setVisible(true);

        break;
    case 1:
        Mode.set("KinectManual");
        papart.forceCameraSize(arDisplayKinect.getWidth(),
                               arDisplayKinect.getHeight());

        activateCameraKinectCorners();
        controlFrame.showSaveKinectButton();
        isSaveButtonShowed = true;

        break;
    case 2:
        Mode.set("KinectMarker");
        arDisplayKinect.automaticMode();
        isCameraKinectMode = true;

        papart.forceCameraSize(arDisplayKinect.getWidth(),
                               arDisplayKinect.getHeight());

        controlFrame.showSaveKinectButton();
        isSaveButtonShowed = true;
        break;
    }
}
