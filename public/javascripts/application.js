// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery("a input[type=button]").each(function() {
    jQuery(this).click(function() { 
        location.href=jQuery(this).closest("a").attr("href");
    });
});

Event.addBehavior({
    "select.tcl_tcap:change": function(ev) {
         Hobo.ajaxRequest(window.location.href, ["level-part"], {
             params: Form.serializeElements([this]),
             method: "get",
             spinnerNextTo: this,
             message: "Processing..."
         });
     }
});
