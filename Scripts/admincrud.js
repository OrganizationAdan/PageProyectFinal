botonprin = document.querySelector(".add-suc");
botonprin.addEventListener("click", () => {
  const formu = document.querySelector("#formu");
  formu.classList.toggle("hide");

  const botonform = document.querySelector(".action-btn");
  botonform.innerHTML = " ";
  botonform.innerHTML = `<button onclick="creacion()" id="boton-form">
  Guardar
</button>`;
});

fetch("http://localhost:8080/sucursal")
  .then((data) => data.json())
  .then((data) => {
    const container = document.querySelector(".body");
    const formu = document.querySelector("#formu");
    for (let x of data) {
      const info = document.createElement("div");
      info.classList.add("body-edit");
      info.innerHTML = `   <div class="body-crud">
    <h3>${x.nombre}</h3>
    <p>codigo de sucursal: ${x.cod_sucursal}  ubicacion: ${x.ubicacion}</p>
    <div class="action-btn">
      <button id="ver">Ver detallesr</button>
      <button id="edit">editar</button>
      <button id="borrar">Borrar</button>
    </div>
  </div>`;

      container.appendChild(info);

      const boton = info.querySelector("#edit");
      boton.addEventListener("click", () => {
        formu.classList.toggle("hide");
        const formm = formu.querySelector(".form-crud");
        formm.elements.cod_sucursal.value = x.cod_sucursal;
        formm.elements.ubicacion.value = x.ubicacion;
        formm.elements.nombre.value = x.nombre;
        edicion();
      });

      const botonver = info.querySelector("#ver");
      botonver.addEventListener("click", () => {
        window.location.href = `detalles.html?id=${x.cod_sucursal}`;
      });

      const borrar = info.querySelector("#borrar");
      borrar.addEventListener("click", () => {
        fetch("http://localhost:8080/sucursal/" + x.cod_sucursal, {
          method: "delete",
        }).then(() => {
          alert("dato borrado!");
          window.location.href = "AdminCRUD.html";
        });
      });
    }
  });

function edicion() {
  const botonform = document.querySelector(".action-btn");
  botonform.innerHTML = " ";
  botonform.innerHTML = `<button onclick="actualizarDatos()" id="boton-form">
  Guardar
</button>`;
}

function creacion() {
  const actform = document.querySelector(".form-crud");
  const obj = {
    cod_sucursal: actform.elements.cod_sucursal.value,
    ubicacion: actform.elements.ubicacion.value,
    nombre: actform.elements.nombre.value,
  };
  fetch("http://localhost:8080/sucursal", {
    method: "post",
    body: JSON.stringify(obj),
    headers: { "Content-Type": "application/json; charset = UTF-8" },
  }).then(() => {
    alert("datos actualizados!");
    window.location.href = "AdminCRUD.html";
  });
}

function actualizarDatos() {
  const actform = document.querySelector(".form-crud");
  const obj = {
    cod_sucursal: actform.elements.cod_sucursal.value,
    ubicacion: actform.elements.ubicacion.value,
    nombre: actform.elements.nombre.value,
  };
  console.log(obj);
  alert("datos ingresados");
  fetch(
    "http://localhost:8080/sucursal/" + actform.elements.cod_sucursal.value,
    {
      method: "put",
      body: JSON.stringify(obj),
      headers: { "Content-Type": "application/json; charset = UTF-8" },
    }
  ).then(() => {
    alert("datos actualizados!");
    window.location.href = "AdminCRUD.html";
  });
}
