const formulario = document.querySelector(".registrarse");

formulario.addEventListener("submit", (e) => {
  e.preventDefault();
  let datos = {
    correo: formulario.elements.correo.value,
    usuario: formulario.elements.usuario.value,
    contrasenia: formulario.elements.contrasenia.value,
  };
  console.log(datos);
  registrarse(datos);
});

function registrarse(obj) {
  fetch("http://localhost:8080/registro", {
    method: "post",
    body: JSON.stringify(obj),
    headers: { "Content-Type": "application/json; charset = UTF-8" },
  }).then(async (req) => {
    try {
      const id = await req.text();
      console.log(id);
      if (id) {
        window.location.href = `PerfilUsuario.html?id=${id}`;
      } else {
        alert("Datos incorrectos!, intente nuevamentes");
      }
    } catch (error) {
      console.log(error);
      alert("Datos incorrectos!, intente nuevamentes");
    }
  });
}
