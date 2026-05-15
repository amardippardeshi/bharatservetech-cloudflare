async function loadComponent(id, file) {

  try {

    const response = await fetch(file);

    if (!response.ok) {
      throw new Error("Component load failed");
    }

    const html = await response.text();

    document.getElementById(id).innerHTML = html;

  } catch (error) {

    console.error("Component Loader Error:", error);

  }

}
