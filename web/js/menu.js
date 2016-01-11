var segundoClick = 0;

function btnaddstate(){
    $("#addStateMenu").css("visibility","visible");
    $("#addTranMenu").css("visibility","hidden");
    $("#lblEventos").css("visibility","visible");
    $("#stateevents").css("visibility","visible");
    segundoClick++;
    if (segundoClick==2) {
        if(!$("#statename").val() || !$("#stateevents").val()){
            alert('Campos incompletos !');
        } else{
            segundoClick = 0;
            addState();
        }
    }
}

function btnaddlink(){
    $("#addTranMenu").css("visibility","visible");
    $("#addStateMenu").css("visibility","hidden");
    $("#lblEventos").css("visibility","hidden");
    $("#stateevents").css("visibility","hidden");
    segundoClick++;
    if (segundoClick==2) {
        if(!$("#stateSource").val() || !$("#stateTarget").val() || !$("#linkLabel").val() ){
            alert('Campos incompletos !');
        } else{
            segundoClick = 0;
            addTrans();
        }
    }
}

function btnaddmodstate(){
    $("#addStateMenu").css("visibility","visible");
    $("#addTranMenu").css("visibility","hidden");
    $("#lblEventos").css("visibility","visible");
    $("#stateevents").css("visibility","visible");
}

function btndelstate(){
    $("#addTranMenu").css("visibility","hidden");
    $("#addStateMenu").css("visibility","visible");
    $("#lblEventos").css("visibility","hidden");
    $("#stateevents").css("visibility","hidden");
}


