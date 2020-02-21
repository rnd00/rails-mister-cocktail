const toggleDelete = () => {
  const b = document.getElementById('toggle-delete');
  if (b) {
    b.addEventListener("click", () => {
      const a = document.querySelectorAll('#delete-button');
      a.forEach( e => e.classList.toggle("hidden"));
    });
  }
};

export { toggleDelete };
