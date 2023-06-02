$(document).ready(function () {
  $(".datepicker").datepicker();
  $(".select-menu").selectmenu();
  $(".sec-table").hide();
  $(".sidebaroverlay").hide();
  $(".check-statement").click(function () {
      $(".product-sec").hide();
      $(".sec-table").show();
  });
  $(".close-sec-table").click(function () {
      $(".sec-table").hide();
      $(".product-sec").show();
  });
  $(".increbtn").on("click", function () {
      var v = $(this)
          .closest("div.increment-input")
          .find("input")
          .val(Number($(this).closest("div.increment-input").find("input").val()) + 1);
      console.log(v);
  });
  $(".decrebtn").on("click", function () {
      if (Number($(this).closest("div.increment-input").find("input").val() > 1)) {
          var v = $(this)
              .closest("div.increment-input")
              .find("input")
              .val(Number($(this).closest("div.increment-input").find("input").val()) - 1);
          console.log(v);
      }
  });
});
function openNav() {
  $(".sidebaroverlay").show();
  $(".sidebaroverlay").css("height", $("body").height());
  document.getElementById("mySidebar").style.width = "37%";
  document.getElementById("main").style.marginLeft = "37%";
}
function closeNav() {
  $(".sidebaroverlay").hide();
  document.getElementById("mySidebar").style.width = "0";
  document.getElementById("main").style.marginLeft = "0";
}
