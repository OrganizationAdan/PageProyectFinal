const parametros = window.location.search;

const urlParams = new URLSearchParams(parametros);
const sucurid = urlParams.get("id");

fetch("http://localhost:8080/sucursal/" + sucurid)
  .then((data) => data.json())
  .then((data) => {
    const contenedor = document.querySelector(".body");
    for (let x of data) {
      const nodo = document.createElement("div");
      nodo.classList.add("textu");
      nodo.innerHTML = ` <h2>${x.nombre}</h2>
    <p>
      codigo: ${x.cod_sucursal} ubicacion: ${x.ubicacion} nombre de sucursal: ${x.nombre}
    </p>`;
      contenedor.appendChild(nodo);
    }
  });
