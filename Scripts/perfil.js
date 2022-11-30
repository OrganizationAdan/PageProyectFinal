if (window.location.search === "") {
  alert("inicie sesion para acceder a mi perfil");
  window.location.href = "LOGIN.html";
}

const parametros = window.location.search;

const urlParams = new URLSearchParams(parametros);
const userid = urlParams.get("id");

fetch("http://localhost:8080/usuario/" + userid)
  .then((response) => response.json())
  .then((data) => {
    for (let x of data) {
      const contenedor = document.querySelector(".Perfil");
      const datos = document.createElement("div");
      datos.classList.add("divisor");
      datos.innerHTML = ` 
      <div class ="perfil-usuario"> 
      <img src="../IMG/indexIMG/usuario.jpg" alt="" />
      <p>Usuario: ${x.usuario}</p>
      <p>Correo: ${x.correo}</p>
      <div class="edit-delete">
        <button onclick = "mostrarEditar()">Editar Perfil</button>
        <button onclick = "borrarUsuario()" >Borrar Perfil</button>
      </div>
      </div>
      <div class="datos-usuario hide">
      <div class="titulo">
      <center><h1>Información Personal</h1></center>
      <form action="" id="act-form">
        <p>
          <label for="">Usuario</label><br />
          <input type="text" value= "${x.usuario}" name="usuario" />
        </p>
        <p>
          <label for="">Correo</label><br />
          <input type="text" value= "${x.correo}" name="correo"/>
        </p>
        <p>
          <label for="Email">contrasenia</label><br />
          <input type="text" value= "${x.contrasenia}" name="contrasenia"/>
        </p>
        <p class="block">
          <button type="button" onclick="actualizarDatos()" id="actualizar-btn">Actualizar</button>
        </p>
      </form>
    </div>
     `;
      contenedor.prepend(datos);
    }
  });

function mostrarEditar() {
  document.querySelector(".datos-usuario").classList.toggle("hide");
}

function borrarUsuario() {
  try {
    console.log("ss");
    fetch("http://localhost:8080/usuario/borrar/" + userid, {
      method: "delete",
    }).then(() => {
      alert("Su cuenta ha sido borrada!");
      window.location.href = "../index.html";
    });
  } catch (e) {
    console.log(e);
  }
}

function actualizarDatos() {
  const actform = document.querySelector("#act-form");
  const obj = {
    correo: actform.elements.correo.value,
    usuario: actform.elements.usuario.value,
    contrasenia: actform.elements.contrasenia.value,
  };
  fetch("http://localhost:8080/usuario/editar/" + userid, {
    method: "put",
    body: JSON.stringify(obj),
    headers: { "Content-Type": "application/json; charset = UTF-8" },
  }).then(() => {
    alert("datos actualizados!");
    window.location.href = "PerfilUsuario.html?id=" + obj.correo;
  });
}
