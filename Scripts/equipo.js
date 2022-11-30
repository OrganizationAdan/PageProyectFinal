fetch("http://localhost:8080/equipo")
  .then((data) => data.json())
  .then((data) => {
    const container = document.querySelector(".seccion");
    for (let x of data) {
      const info = document.createElement("div");
      info.classList.add("nombres");
      info.innerHTML = ` <img
    src="${x.e_foto}"
    alt=""
    class="img-perfil"
  />
  <h1 class="h1">${x.e_nombre}</h1>
  <h3 class="h3">Alias "${x.e_alias}"</h3>
  <p class="p">${x.e_desc}</p>`;
      container.appendChild(info);
    }
  });
