const reveals = document.querySelectorAll(".reveal");
const navLinks = document.querySelectorAll(".site-nav a");
const sections = [...document.querySelectorAll("main section[id]")];

const revealObserver = new IntersectionObserver(
  entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add("visible");
      }
    });
  },
  { threshold: 0.12 }
);

reveals.forEach(node => revealObserver.observe(node));

const updateActiveLink = () => {
  let currentId = sections[0]?.id || "";
  sections.forEach(section => {
    const rect = section.getBoundingClientRect();
    if (rect.top <= 160 && rect.bottom > 160) {
      currentId = section.id;
    }
  });

  navLinks.forEach(link => {
    const href = link.getAttribute("href");
    const isActive = href === `#${currentId}`;
    link.classList.toggle("is-active", isActive);
  });
};

window.addEventListener("scroll", updateActiveLink, { passive: true });
window.addEventListener("load", updateActiveLink);

const workflowCards = document.querySelectorAll(".workflow-card");
if (workflowCards.length) {
  const workflowObserver = new IntersectionObserver(
    entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const step = entry.target.dataset.step;
          entry.target.style.transitionDelay = `${(Number(step) - 1) * 0.06}s`;
          entry.target.classList.add("is-visible");
        }
      });
    },
    { threshold: 0.2 }
  );

  workflowCards.forEach(card => workflowObserver.observe(card));
}
