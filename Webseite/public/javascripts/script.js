function copyCommand(element) {
  const command = element.innerText.trim();
  const sliced = command.slice(2);
  navigator.clipboard.writeText(sliced)
    .then(() => {
      console.log('Text kopiert: ', sliced);
    })
    .catch(err => {
      console.error('Fehler beim Kopieren: ', err);
    });
}