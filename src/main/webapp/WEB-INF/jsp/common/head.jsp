<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="필그림시니어랜드 - 대전에서 건강하고 행복한 노년을 준비하는 시니어복지주택">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/psl.ico">
<link href="https://fonts.googleapis.com" rel="preconnect">
<link crossorigin href="https://fonts.gstatic.com" rel="preconnect">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&family=Inter:wght@400;500;600&family=Manrope:wght@600;700;800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script id="tailwind-config">
  tailwind.config = {
    darkMode: "class",
    theme: {
      extend: {
        colors: {
          "primary":                    "#00658b",
          "on-primary":                 "#ffffff",
          "primary-container":          "#77cefe",
          "on-primary-container":       "#005778",
          "primary-fixed":              "#c4e7ff",
          "primary-fixed-dim":          "#7cd0ff",
          "on-primary-fixed":           "#001e2c",
          "on-primary-fixed-variant":   "#004c69",
          "secondary":                  "#515f74",
          "on-secondary":               "#ffffff",
          "secondary-container":        "#d5e3fd",
          "on-secondary-container":     "#57657b",
          "secondary-fixed":            "#d5e3fd",
          "secondary-fixed-dim":        "#b9c7e0",
          "on-secondary-fixed":         "#0d1c2f",
          "on-secondary-fixed-variant": "#3a485c",
          "tertiary":                   "#4a626d",
          "on-tertiary":                "#ffffff",
          "tertiary-container":         "#afc8d5",
          "on-tertiary-container":      "#3d545f",
          "tertiary-fixed":             "#cde6f4",
          "tertiary-fixed-dim":         "#b1cad7",
          "on-tertiary-fixed":          "#051e28",
          "on-tertiary-fixed-variant":  "#334a55",
          "surface":                    "#f7f9fb",
          "surface-dim":                "#d8dadc",
          "surface-bright":             "#f7f9fb",
          "surface-container-lowest":   "#ffffff",
          "surface-container-low":      "#f2f4f6",
          "surface-container":          "#eceef0",
          "surface-container-high":     "#e6e8ea",
          "surface-container-highest":  "#e0e3e5",
          "surface-variant":            "#e0e3e5",
          "on-surface":                 "#191c1e",
          "on-surface-variant":         "#3f484c",
          "inverse-surface":            "#2d3133",
          "inverse-on-surface":         "#eff1f3",
          "inverse-primary":            "#7cd0ff",
          "outline":                    "#6f787d",
          "outline-variant":            "#bfc8cd",
          "background":                 "#f7f9fb",
          "on-background":              "#191c1e",
          "error":                      "#ba1a1a",
          "on-error":                   "#ffffff",
          "error-container":            "#ffdad6",
          "on-error-container":         "#93000a",
          "surface-tint":               "#00658b",
        },
        borderRadius: {
          "DEFAULT": "0.25rem",
          "lg":      "1rem",
          "xl":      "1.5rem",
          "full":    "9999px",
        },
        fontFamily: {
          "headline": ["Manrope", "Noto Sans KR", "sans-serif"],
          "body":     ["Noto Sans KR", "Inter", "sans-serif"],
          "label":    ["Noto Sans KR", "Inter", "sans-serif"],
        },
      },
    },
  }
</script>
<style>
  body { font-family: 'Noto Sans KR', 'Inter', sans-serif; }
  .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
  .glass-header { background-color: rgba(255,255,255,1); backdrop-filter: blur(24px); }
  .hero-gradient { background: linear-gradient(135deg, #00658b 0%, #77cefe 100%); }
  .ambient-shadow { box-shadow: 0 20px 40px rgba(25,28,30,0.06); }

  /* Scroll reveal */
  .reveal {
    opacity: 0;
    transform: translateY(40px);
    transition: opacity 0.7s ease, transform 0.7s ease;
  }
  .reveal.visible {
    opacity: 1;
    transform: translateY(0);
  }
  .reveal-delay-1 { transition-delay: 0.1s; }
  .reveal-delay-2 { transition-delay: 0.2s; }
  .reveal-delay-3 { transition-delay: 0.3s; }
  .reveal-delay-4 { transition-delay: 0.4s; }
</style>
