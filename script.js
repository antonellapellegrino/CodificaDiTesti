$(document).ready(function () {
    // Mostra gli elementi aggiunte (class "add")
    $("#btn-add").click(function () {
      $(".add").css("display", "inline");
    });
  
    // Mostra gli elementi cancellature (class "del")
    $("#btn-del").click(function () {
      $(".del").css("display", "inline");
    });
  
    // Mostra gli elementi lacune (class "gap")
    $("#btn-gap").click(function () {
      $(".gap").css("display", "inline");
    });
  
    // Evidenzia gli elementi persone (class "persname") - Verde opaco
    $("#btn-persname").click(function () {
      $(".persname").css("background-color", "rgba(144, 238, 144, 0.5)"); // Verde opaco
    });
  
    // Evidenzia gli elementi luoghi (class "placename") - Viola opaco
    $("#btn-placename").click(function () {
      $(".placename").css("background-color", "rgba(216, 191, 216, 0.5)"); // Viola opaco
    });
  
    // Nascondi tutto
    $("#btn-hide").click(function () {
      $(".add, .del, .gap").hide(); // Nasconde aggiunte, cancellature, lacune
      $(".persname, .placename").css("background-color", "transparent"); // Rimuove l'evidenziazione
    });
  });