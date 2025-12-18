void keyPressed(){
  switch(state){
    case 0: titleKP(); break;
    case 1: informed_consentKP(); break;
    case 2: subject_infomationKP(); break;
    case 3: descriptionKP(); break;
    case 4: runningKP(); break;
    case 5: descriptionKP(); break;
    case 6: confirm_exitKP(); break;
    case 7: confirm_submitKP(); break;
    case 8: finishKP(); break;
    default: break;
  }
}
