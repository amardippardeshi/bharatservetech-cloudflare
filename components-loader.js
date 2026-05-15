<!-- CTA SYSTEM START -->
<div id="bst-cta"></div>

<script src="components-loader.js" defer></script>

<script>
window.addEventListener("load", function () {
  if (typeof loadComponent === "function") {
    loadComponent("bst-cta", "components/cta.html");
  } else {
    console.error("CTA Loader not found");
  }
});
</script>
<!-- CTA SYSTEM END -->