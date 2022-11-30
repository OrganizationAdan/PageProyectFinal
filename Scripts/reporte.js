fetch("http://localhost:8080/atenciones")
  .then((data) => data.json())
  .then((data) => {
    const contenedor = document.querySelector(".reportes");
    for (let atencion of data) {
      const info = document.createElement("div");
      info.classList.add("reporte");
      info.innerHTML = `<img
    src="${atencion.foto}"
    alt=""
  />
  <div>
    <h2>${atencion.servicios}</h2>
    <p>
      ${atencion.nombre_mascota} utilizo nuestro servicio de ${atencion.servicios} y fue atendendido por
      nuestro especialista ${atencion.nombre} el dia ${atencion.fecha}
    </p>
    
  </div>`;
      contenedor.appendChild(info);
    }
  });

const mostrar = document.querySelector(".mostrar");
mostrar.addEventListener("click", () => {
  const contenedor = document.querySelector(".reportes");
  contenedor.classList.toggle("ocultar");
});
