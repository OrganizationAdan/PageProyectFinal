formulario = document.querySelector(".registrarse");

console.log(formulario);

formulario.addEventListener("submit", (e) => {
  e.preventDefault();
  let datos = {
    correo: formulario.elements.correo.value,
    usuario: "",
    contrasenia: formulario.elements.contrasenia.value,
  };
  validar(datos);
});

function validar(obj) {
  fetch("http://localhost:8080/verificar", {
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
