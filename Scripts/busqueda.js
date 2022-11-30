const parametros = window.location.search;

const urlParams = new URLSearchParams(parametros);
const query = urlParams.get("q");
const query2 = urlParams.get("q2") || "sucursal";

console.log(query + " " + query2);

switch (query2) {
  case "sucursal":
    fetch("http://localhost:8080/sucursal")
      .then((data) => data.json())
      .then((data) => {
        const arrai = [...data];
        const prueba = arrai.filter((x) => {
          let nombre = x.nombre.toLowerCase();
          return nombre.includes(query.toLowerCase());
        });

        for (let x of prueba) {
          innhtml = ` <div class="body-crud">
            <a href=""><h3>${x.nombre}</h3></a>
            <p>Sucursal ${x.cod_sucursal}, ubicacion: ${x.ubicacion}</p>
          </div>`;
          crearContenido(innhtml);
        }
      });
    break;

  case "equipo":
    fetch("http://localhost:8080/equipo")
      .then((data) => data.json())
      .then((data) => {
        const arrai = [...data];
        const prueba = arrai.filter((x) => {
          let nombre = x.e_nombre.toLowerCase();
          return nombre.includes(query.toLowerCase());
        });

        for (let x of prueba) {
          innhtml = ` <div class="body-crud">
          <a href=""><h3>${x.e_nombre}</h3></a>
          <p>${x.e_desc}</p>
        </div>`;
          crearContenido(innhtml);
        }
      });
    break;

  case "atenciones":
    fetch("http://localhost:8080/atenciones")
      .then((data) => data.json())
      .then((data) => {
        const arrai = [...data];
        const prueba = arrai.filter((x) => {
          let nombre = x.nombre_mascota.toLowerCase();
          return nombre.includes(query.toLowerCase());
        });
        for (let x of prueba) {
          innhtml = ` <div class="body-crud">
          <a href=""><h3>Servicio de ${x.servicios} a ${x.nombre_mascota}</h3></a>
          <p> ${x.nombre_mascota} utilizo nuestro servicio de ${x.servicios} y fue atendendido por
          nuestro especialista ${x.nombre} el dia ${x.fecha}</p>
        </div>`;
          crearContenido(innhtml);
        }
      });
    break;

  default:
    alert("oops ha ocurrido un error!");
    break;
}

function crearContenido(innhtml) {
  const container = document.querySelector(".body");
  const info = document.createElement("div");
  info.classList.add("body-edit");
  info.innerHTML = innhtml;
  container.appendChild(info);
}
