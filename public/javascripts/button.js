<script>
	jQuery(function() {
		jQuery( "button, input:submit, a", ".demo" ).button();
		jQuery( "a", ".demo" ).click(function() { return false; });
	});
</script>
