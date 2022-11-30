fetch("http://localhost:8080/perros")
  .then((data) => data.json())
  .then((data) => {
    const container = document.querySelector(".perros");
    for (let x of data) {
      const info = document.createElement("div");
      info.classList.add("perro-info");
      info.innerHTML = `<img
        src="${x.foto}"
        alt=""
      />
      <h2>${x.raza}</h2>
      <p class = "hide" id="prro-desc">${x.descripcion}</p>`;

      info.addEventListener("click", () => {
        info.lastElementChild.classList.toggle("hide");
        p.classList.remove("hide");
      });

      container.appendChild(info);
    }
  });
