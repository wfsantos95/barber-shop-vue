<template>
  <div class="min-h-screen bg-neutral-500 font-serif">
    <!-- Header -->
    <header class="fixed top-0 left-0 right-0 z-50 bg-neutral-900/95 backdrop-blur-sm border-b border-neutral-800">
      <nav class="w-full max-w-7xl mx-auto px-4 py-4">
        <div class="flex items-center justify-between">
          <!-- Logo -->
          <a href="#" class="text-2xl font-bold text-amber-500 flex-shrink-0">
            {{ content.header.logo.text }}
          </a>

          <!-- Desktop Navigation -->
          <ul class="hidden md:flex items-center space-x-4 md:space-x-8">
            <li v-for="(item, index) in content.header.navigation" :key="index">
              <a
                  :href="item.href"
                  class="text-neutral-300 hover:text-amber-500 transition-colors duration-300"
              >
                {{ item.text }}
              </a>
            </li>
          </ul>

          <!-- Desktop CTA Button and Mobile Menu Button Container -->
          <div class="flex items-center space-x-2">
            <!-- CTA Button -->
            <a
                :href="content.header.cta.href"
                class="hidden md:inline-block px-6 py-2 bg-amber-500 text-neutral-900 hover:bg-neutral-200 transition-colors duration-300 font-semibold"
            >
              {{ content.header.cta.text }}
            </a>

            <!-- Mobile Menu Button -->
            <button
                @click="mobileMenuOpen = !mobileMenuOpen"
                class="md:hidden text-amber-500 p-2 flex-shrink-0"
                :aria-label="mobileMenuOpen ? 'Fechar menu' : 'Abrir menu'"
            >
              <svg v-if="!mobileMenuOpen" class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
              </svg>
              <svg v-else class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>
        </div>

        <!-- Mobile Menu -->
        <div v-if="mobileMenuOpen" class="md:hidden mt-4 pb-4 border-t border-neutral-800 pt-4">
          <ul class="space-y-4">
            <li v-for="(item, index) in content.header.navigation" :key="index">
              <a
                  :href="item.href"
                  class="block text-neutral-300 hover:text-amber-500 transition-colors duration-300"
                  @click="mobileMenuOpen = false"
              >
                {{ item.text }}
              </a>
            </li>
            <li>
              <a
                  :href="content.header.cta.href"
                  class="block px-6 py-2 bg-amber-500 text-neutral-900 text-center hover:bg-neutral-200 transition-colors duration-300 font-semibold"
              >
                {{ content.header.cta.text }}
              </a>
            </li>
          </ul>
        </div>
      </nav>
    </header>

    <!-- Hero Section -->
    <section
        id="hero"
        class="relative min-h-screen flex items-center justify-center bg-cover bg-center"
        :style="{ backgroundImage: `url(${content.hero.backgroundImage})` }"
    >
      <div class="absolute inset-0 bg-neutral-900/70"></div>
      <div class="relative w-full max-w-7xl mx-auto px-4 py-32 md:py-40">
        <div class="max-w-2xl">
          <span class="inline-block px-4 py-2 bg-neutral-800 text-amber-500 text-sm font-semibold mb-6 uppercase tracking-wider">
            {{ content.hero.badge }}
          </span>
          <h1 class="text-5xl md:text-7xl font-bold text-neutral-300 mb-6 leading-tight">
            {{ content.hero.title.before }}
            <span class="block  text-amber-500 ">{{ content.hero.title.highlight }}</span>
          </h1>
          <p class="text-xl text-neutral-300 mb-8 leading-relaxed">
            {{ content.hero.description }}
          </p>
          <a
              :href="content.hero.cta.href"
              class="inline-block px-8 py-4 bg-amber-500 text-neutral-900 text-lg font-semibold hover:bg-neutral-200 transition-colors duration-300"
          >
            {{ content.hero.cta.text }}
          </a>
        </div>
      </div>
    </section>

    <!-- About Section -->
    <section id="sobre" class="py-20 md:py-32 bg-neutral-100">
      <div class="w-full max-w-7xl mx-auto px-4">
        <div class="grid md:grid-cols-2 gap-12 items-center">
          <div class="grid grid-cols-2 gap-4">
            <img
                v-for="(image, index) in content.about.images"
                :key="index"
                :src="image.src"
                :alt="image.alt"
                class="w-full h-64 object-cover shadow-lg hover:scale-105 transition-transform duration-300"
            />
          </div>

          <div>
            <h2 class="text-4xl md:text-5xl font-bold text-neutral-900 mb-6">
              {{ content.about.sectionTitle.before }}
              <span class="block text-neutral-600">{{ content.about.sectionTitle.highlight }}</span>
            </h2>
            <p class="text-lg text-neutral-700 mb-8 leading-relaxed">
              {{ content.about.description }}
            </p>
            <a
                :href="content.about.cta.href"
                class="inline-block px-6 py-3 border-2 border-neutral-900 text-neutral-900 font-semibold hover:bg-neutral-900 hover:text-amber-500 transition-all duration-300"
            >
              {{ content.about.cta.text }}
            </a>
          </div>
        </div>
      </div>
    </section>

    <!-- Services Section -->
    <section id="servicos" class="py-20 md:py-32 bg-neutral-900">
      <div class="w-full max-w-7xl mx-auto px-4">
        <div class="text-center mb-16">
          <span class="inline-block px-4 py-2 bg-neutral-800 text-amber-500 text-sm font-semibold mb-4 uppercase tracking-wider">
            {{ content.services.badge }}
          </span>
          <h2 class="text-4xl md:text-5xl font-bold text-amber-500">
            {{ content.services.title.before }}
            <span class="block text-neutral-400">{{ content.services.title.highlight }}</span>
          </h2>
        </div>

        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          <article
              v-for="service in content.services.items"
              :key="service.id"
              class="bg-neutral-800 overflow-hidden shadow-lg hover:shadow-2xl transition-shadow duration-300 group"
          >
            <div class="relative overflow-hidden">
              <img
                  :src="service.image"
                  :alt="service.name"
                  class="w-full h-64 object-cover group-hover:scale-110 transition-transform duration-500"
              />
              <span
                  v-if="service.badge"
                  class="absolute top-4 left-4 px-3 py-1 bg-neutral-900 text-amber-500 text-xs font-bold uppercase"
              >
                {{ service.badge }}
              </span>
            </div>
            <div class="p-6">
              <h3 class="text-2xl font-bold text-amber-500 mb-2">{{ service.name }}</h3>
              <p class="text-3xl font-bold text-neutral-300 mb-4">{{ service.price }}</p>
              <button class="w-full py-3 bg-amber-500 text-neutral-900 font-semibold hover:bg-neutral-200 transition-colors duration-300">
                {{ service.cta }}
              </button>
            </div>
          </article>
        </div>
      </div>
    </section>

    <!-- Team Section -->
    <section id="equipe" class="py-20 md:py-32 bg-neutral-100">
      <div class="w-full max-w-7xl mx-auto px-4">
        <div class="text-center mb-16">
          <span class="inline-block px-4 py-2 bg-neutral-800 text-amber-500 text-sm font-semibold mb-4 uppercase tracking-wider">
            {{ content.team.badge }}
          </span>
          <h2 class="text-4xl md:text-5xl font-bold text-neutral-900">
            {{ content.team.title.before }}
            <span class="block text-neutral-600">{{ content.team.title.highlight }}</span>
          </h2>
        </div>

        <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
          <article
              v-for="member in content.team.members"
              :key="member.id"
              class="text-center group"
          >
            <div class="relative mb-4 overflow-hidden">
              <img
                  :src="member.image"
                  :alt="member.name"
                  class="w-full h-80 object-cover group-hover:scale-110 transition-transform duration-500"
              />
            </div>
            <h3 class="text-xl font-bold text-neutral-900 mb-1">{{ member.name }}</h3>
            <p class="text-neutral-600">{{ member.role }}</p>
          </article>
        </div>
      </div>
    </section>

    <!-- Testimonials Section -->
    <section id="depoimentos" class="py-20 md:py-32 bg-neutral-900">
      <div class="w-full max-w-7xl mx-auto px-4">
        <div class="text-center mb-16">
          <span class="inline-block px-4 py-2 bg-neutral-800 text-amber-500 text-sm font-semibold mb-4 uppercase tracking-wider">
            {{ content.testimonials.badge }}
          </span>
          <h2 class="text-4xl md:text-5xl font-bold text-amber-500">
            {{ content.testimonials.title.before }}
            <span class="block text-neutral-400">{{ content.testimonials.title.highlight }}</span>
          </h2>
        </div>

        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          <article
              v-for="testimonial in content.testimonials.items"
              :key="testimonial.id"
              class="bg-neutral-800 p-8 hover:shadow-2xl transition-shadow duration-300"
          >
            <div class="flex items-center mb-6">
              <img
                  :src="testimonial.image"
                  :alt="testimonial.name"
                  class="w-16 h-16 object-cover mr-4"
              />
              <div>
                <h3 class="text-lg font-bold text-amber-500">{{ testimonial.name }}</h3>
                <p class="text-neutral-400 text-sm">{{ testimonial.company }}</p>
              </div>
            </div>
            <p class="text-neutral-300 leading-relaxed">{{ testimonial.text }}</p>
          </article>
        </div>
      </div>
    </section>

    <!-- Locations Section -->
    <section id="localizacao" class="py-20 md:py-32 bg-neutral-100">
      <div class="w-full max-w-7xl mx-auto px-4">
        <div class="text-center mb-16">
          <span class="inline-block px-4 py-2 bg-neutral-800 text-amber-500 text-sm font-semibold mb-4 uppercase tracking-wider">
            {{ content.locations.badge }}
          </span>
          <h2 class="text-4xl md:text-5xl font-bold text-neutral-900">
            {{ content.locations.title.before }}
            <span class="block text-neutral-600">{{ content.locations.title.highlight }}</span>
          </h2>
        </div>

        <div class="grid md:grid-cols-3 gap-8 mb-16">
          <article
              v-for="store in content.locations.stores"
              :key="store.id"
              class="bg-amber-500 p-8 text-center hover:bg-neutral-200 transition-colors duration-300 border-l-4 border-neutral-900"
          >
            <h3 class="text-2xl font-bold text-neutral-900 mb-4">{{ store.name }}</h3>
            <p class="text-neutral-700 mb-4 whitespace-pre-line">{{ store.address }}</p>
            <a :href="'tel:' + store.phone" class="text-neutral-900 font-semibold hover:text-neutral-600 transition-colors">
              {{ store.phone }}
            </a>
          </article>
        </div>

        <div class="flex justify-center">
          <article
              v-for="(schedule, index) in content.locations.schedule"
              :key="index"
              class="bg-neutral-800 p-6 text-center"
          >
            <h4 class="text-lg font-bold text-amber-500 mb-2">{{ schedule.day }}</h4>
            <p class="text-neutral-300 text-sm">{{ schedule.hours }}</p>
          </article>
        </div>
      </div>
    </section>

    <!-- Contact Section -->
    <section id="contato" class="py-20 md:py-32 bg-neutral-900">
      <div class="w-full max-w-3xl mx-auto px-4">
        <div class="text-center mb-16">
          <span class="inline-block px-4 py-2 bg-neutral-800 text-amber-500 text-sm font-semibold mb-4 uppercase tracking-wider">
            {{ content.contact.badge }}
          </span>
          <h2 class="text-4xl md:text-5xl font-bold text-amber-500">
            {{ content.contact.title.before }}
            <span class="block text-neutral-400">{{ content.contact.title.highlight }}</span>
          </h2>
        </div>

        <form @submit.prevent="handleSubmit" class="space-y-6">
          <div class="grid md:grid-cols-2 gap-6">
            <div>
              <label :for="'name'" class="block text-amber-500 mb-2">{{ content.contact.form.fields.name.label }}</label>
              <input
                  type="text"
                  id="name"
                  :placeholder="content.contact.form.fields.name.placeholder"
                  class="w-full px-4 py-3 bg-neutral-800 text-amber-500 border border-neutral-700 rounded-lg focus:border-amber-5000 focus:outline-none"
                  required
              />
            </div>
            <div>
              <label :for="'date'" class="block text-amber-500 mb-2">{{ content.contact.form.fields.date.label }}</label>
              <input
                  type="text"
                  id="date"
                  :placeholder="content.contact.form.fields.date.placeholder"
                  class="w-full px-4 py-3 bg-neutral-800 text-amber-500 border border-neutral-700 rounded-lg focus:border-amber-5000 focus:outline-none"
                  required
              />
            </div>
          </div>

          <div class="grid md:grid-cols-2 gap-6">
            <div>
              <label :for="'email'" class="block text-amber-500 mb-2">{{ content.contact.form.fields.email.label }}</label>
              <input
                  type="email"
                  id="email"
                  :placeholder="content.contact.form.fields.email.placeholder"
                  class="w-full px-4 py-3 bg-neutral-800 text-amber-500 border border-neutral-700 rounded-lg focus:border-amber-5000 focus:outline-none"
                  required
              />
            </div>
            <div>
              <label :for="'phone'" class="block text-amber-500 mb-2">{{ content.contact.form.fields.phone.label }}</label>
              <input
                  type="tel"
                  id="phone"
                  :placeholder="content.contact.form.fields.phone.placeholder"
                  class="w-full px-4 py-3 bg-neutral-800 text-amber-500 border border-neutral-700 rounded-lg focus:border-amber-5000 focus:outline-none"
                  required
              />
            </div>
          </div>

          <div>
            <label :for="'message'" class="block text-amber-500 mb-2">{{ content.contact.form.fields.message.label }}</label>
            <textarea
                id="message"
                :placeholder="content.contact.form.fields.message.placeholder"
                rows="5"
                class="w-full px-4 py-3 bg-neutral-800 text-amber-500 border border-neutral-700 rounded-lg focus:border-amber-5000 focus:outline-none resize-none"
                required
            ></textarea>
          </div>

          <div class="flex items-center">
            <input
                type="checkbox"
                id="terms"
                class="w-5 h-5 bg-neutral-800 border-neutral-700 rounded focus:ring-amber-5000 focus:ring-2"
                required
            />
            <label for="terms" class="ml-3 text-neutral-300">
              {{ content.contact.form.terms }}
            </label>
          </div>

          <button
              type="submit"
              class="w-full py-4 bg-amber-500 text-neutral-900 text-lg font-bold hover:bg-neutral-200 transition-colors duration-300"
          >
            {{ content.contact.form.submit }}
          </button>
        </form>
      </div>
    </section>

    <!-- Gallery Section -->
    <section id="galeria" class="py-20 md:py-32 bg-neutral-100">
      <div class="w-full max-w-7xl mx-auto px-4">
        <div class="text-center mb-16">
          <span class="inline-block px-4 py-2 bg-neutral-800 text-amber-500 text-sm font-semibold mb-4 uppercase tracking-wider">
            {{ content.gallery.badge }}
          </span>
          <h2 class="text-4xl md:text-5xl font-bold text-neutral-900">
            {{ content.gallery.title.before }}
            <span class="block text-neutral-600">{{ content.gallery.title.highlight }}</span>
          </h2>
        </div>

        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-2">
          <img
              v-for="(image, index) in content.gallery.images"
              :key="index"
              :src="image.src"
              :alt="image.alt"
              class="w-full h-48 object-cover hover:opacity-75 transition-opacity duration-300 cursor-pointer"
          />
        </div>
      </div>
    </section>

    <!-- Newsletter Section -->
    <section id="newsletter" class="py-20 md:py-32 bg-neutral-900">
      <div class="w-full max-w-3xl mx-auto px-4 text-center">
        <span class="inline-block px-4 py-2 bg-neutral-800 text-amber-500 text-sm font-semibold mb-4 uppercase tracking-wider">
          {{ content.newsletter.badge }}
        </span>
        <h2 class="text-4xl md:text-5xl font-bold text-amber-500 mb-8">
          {{ content.newsletter.title.before }}
          <span class="block">{{ content.newsletter.title.highlight }}</span>
        </h2>

        <form @submit.prevent="handleNewsletterSubmit" class="flex flex-col md:flex-row gap-4">
          <input
              type="email"
              :placeholder="content.newsletter.placeholder"
              class="flex-1 px-6 py-4 bg-neutral-800 text-amber-500 border border-neutral-700 focus:outline-none focus:border-amber-5000"
              required
          />
          <button
              type="submit"
              class="px-8 py-4 bg-amber-500 text-neutral-900 font-bold hover:bg-neutral-200 transition-colors duration-300"
          >
            {{ content.newsletter.button }}
          </button>
        </form>
      </div>
    </section>

    <!-- Footer -->
    <footer class="bg-neutral-950 border-t border-neutral-900 py-16">
      <div class="w-full max-w-7xl mx-auto px-4">
        <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-12 mb-12">
          <!-- About -->
          <div>
            <h3 class="text-2xl font-bold text-amber-500 mb-4">{{ content.footer.about.logo }}</h3>
            <p class="text-neutral-400 leading-relaxed">{{ content.footer.about.text }}</p>
          </div>

          <!-- Company Links -->
          <div>
            <h4 class="text-lg font-bold text-amber-500 mb-4">{{ content.footer.links.company.title }}</h4>
            <ul class="space-y-2">
              <li v-for="(link, index) in content.footer.links.company.items" :key="index">
                <a :href="link.href" class="text-neutral-400 hover:text-amber-500 transition-colors">
                  {{ link.text }}
                </a>
              </li>
            </ul>
          </div>

          <!-- Services -->
          <div>
            <h4 class="text-lg font-bold text-amber-500 mb-4">{{ content.footer.links.services.title }}</h4>
            <ul class="space-y-2">
              <li v-for="(link, index) in content.footer.links.services.items" :key="index">
                <a :href="link.href" class="text-neutral-400 hover:text-amber-500 transition-colors">
                  {{ link.text }}
                </a>
              </li>
            </ul>
          </div>

          <!-- Schedule & Social -->
          <div>
            <h4 class="text-lg font-bold text-amber-500 mb-4">{{ content.footer.links.schedule.title }}</h4>
            <div class="text-neutral-400 space-y-2 mb-6">
              <p>{{ content.footer.links.schedule.weekdays }}</p>
              <p>{{ content.footer.links.schedule.saturday }}</p>
              <p>{{ content.footer.links.schedule.sunday }}</p>
            </div>

            <h4 class="text-lg font-bold text-amber-500 mb-4">{{ content.footer.links.social.title }}</h4>
            <div class="flex space-x-4">
              <a
                  v-for="(social, index) in content.footer.links.social.items"
                  :key="index"
                  :href="social.url"
                  class="w-10 h-10 bg-neutral-900 flex items-center justify-center text-amber-500 hover:bg-neutral-700 transition-colors"
                  :aria-label="social.name"
              >
                <span class="sr-only">{{ social.name }}</span>
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
                  <circle cx="12" cy="12" r="10"/>
                </svg>
              </a>
            </div>
          </div>
        </div>

        <div class="border-t border-neutral-900 pt-8">
          <p class="text-center text-neutral-400">{{ content.footer.copyright }}</p>
        </div>
      </div>
    </footer>
  </div>
</template>

<script setup>
import { ref } from 'vue'

// Importar o conteúdo do JSON
const content = ref({
  "site": {
    "title": "Barbearia Premium",
    "description": "A primeira escolha de um gentleman"
  },
  "header": {
    "logo": {
      "text": "Barber Shop",
      "alt": "Logo da Barbearia"
    },
    "navigation": [
      { "text": "Sobre", "href": "#sobre" },
      { "text": "Serviços", "href": "#servicos" },
      { "text": "Equipe", "href": "#equipe" },
      { "text": "Galeria", "href": "#galeria" },
      { "text": "Contato", "href": "#contato" }
    ],
    "cta": {
      "text": "Agendar Horário",
      "href": "#agendar"
    }
  },
  "hero": {
    "badge": "Barbearia Top Avaliada",
    "title": {
      "before": "A Primeira Escolha",
      "highlight": "de um Gentleman"
    },
    "description": "Oferecemos os melhores serviços de barbearia com profissionais altamente qualificados e produtos premium para você.",
    "cta": {
      "text": "Agendar Atendimento",
      "href": "#agendar"
    },
    "backgroundImage": "https://images.unsplash.com/photo-1585747860715-2ba37e788b70?w=1920&h=1080&fit=crop"
  },
  "about": {
    "sectionTitle": {
      "before": "Inovação é",
      "highlight": "Nossa Força"
    },
    "description": "Com mais de 10 anos de experiência, oferecemos os melhores cortes e serviços de barbearia da região. Nossa equipe é altamente treinada e usa apenas produtos premium para garantir sua satisfação.",
    "cta": {
      "text": "Saiba Mais",
      "href": "#sobre"
    },
    "images": [
      { "src": "https://images.unsplash.com/photo-1503951914875-452162b0f3f1?w=600&h=400&fit=crop", "alt": "Interior da barbearia" },
      { "src": "https://images.unsplash.com/photo-1621605815971-fbc98d665033?w=600&h=400&fit=crop", "alt": "Profissional cortando cabelo" }
    ]
  },
  "services": {
    "badge": "Nossos Serviços",
    "title": {
      "before": "Oferecemos as",
      "highlight": "Melhores Tarifas"
    },
    "items": [
      {
        "id": 1,
        "name": "Corte de Cabelo",
        "price": "R$ 45",
        "badge": "Serviço Rápido",
        "image": "https://images.unsplash.com/photo-1599351431202-1e0f0137899a?w=600&h=400&fit=crop",
        "cta": "Reserve seu Horário"
      },
      {
        "id": 2,
        "name": "Barba",
        "price": "R$ 35",
        "badge": "Serviço Rápido",
        "image": "https://images.unsplash.com/photo-1621605815971-fbc98d665033?w=600&h=400&fit=crop",
        "cta": "Reserve seu Horário"
      },
      {
        "id": 3,
        "name": "Cuidados com a Pele",
        "price": "R$ 60",
        "badge": "Serviço Premium",
        "image": "https://images.unsplash.com/photo-1622287162716-f311baa1a2b8?w=600&h=400&fit=crop",
        "cta": "Reserve seu Horário"
      },
      {
        "id": 4,
        "name": "Coloração",
        "price": "R$ 80",
        "badge": "Serviço Premium",
        "image": "https://images.unsplash.com/photo-1605497788044-5a32c7078486?w=600&h=400&fit=crop",
        "cta": "Reserve seu Horário"
      },
      {
        "id": 5,
        "name": "Aparar",
        "price": "R$ 25",
        "image": "https://images.unsplash.com/photo-1503951914875-452162b0f3f1?w=600&h=400&fit=crop",
        "cta": "Reserve seu Horário"
      },
      {
        "id": 6,
        "name": "Barba Completa",
        "price": "R$ 50",
        "badge": "Serviço Rápido",
        "image": "https://images.unsplash.com/photo-1585747860715-2ba37e788b70?w=600&h=400&fit=crop",
        "cta": "Reserve seu Horário"
      }
    ]
  },
  "team": {
    "badge": "Nossa Equipe",
    "title": {
      "before": "Nossos Super",
      "highlight": "Profissionais"
    },
    "members": [
      {
        "id": 1,
        "name": "Carlos Silva",
        "role": "Barbeiro Especialista",
        "image": "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=400&fit=crop"
      },
      {
        "id": 2,
        "name": "Ana Paula",
        "role": "Barbeira Especialista",
        "image": "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400&h=400&fit=crop"
      },
      {
        "id": 3,
        "name": "João Santos",
        "role": "Barbeiro Senior",
        "image": "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400&h=400&fit=crop"
      },
      {
        "id": 4,
        "name": "Maria Costa",
        "role": "Barbeira Senior",
        "image": "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=400&h=400&fit=crop"
      }
    ]
  },
  "testimonials": {
    "badge": "Depoimentos",
    "title": {
      "before": "O Que Nossos",
      "highlight": "Clientes Dizem"
    },
    "items": [
      {
        "id": 1,
        "name": "Pedro Oliveira",
        "company": "Empresa XYZ",
        "text": "Excelente atendimento! Sempre saio satisfeito com o corte e o ambiente é muito agradável. Recomendo!",
        "image": "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100&h=100&fit=crop"
      },
      {
        "id": 2,
        "name": "Lucas Mendes",
        "company": "Tech Solutions",
        "text": "Profissionais muito competentes. O Carlos faz um trabalho impecável na barba. Melhor barbearia da cidade!",
        "image": "https://images.unsplash.com/photo-1519345182560-3f2917c472ef?w=100&h=100&fit=crop"
      },
      {
        "id": 3,
        "name": "Rafael Costa",
        "company": "Digital Corp",
        "text": "Ambiente moderno e profissionais experientes. Estou muito satisfeito com os serviços prestados.",
        "image": "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=100&h=100&fit=crop"
      }
    ]
  },
  "locations": {
    "badge": "Localização e Horários",
    "title": {
      "before": "Estamos",
      "highlight": "Te Esperando"
    },
    "stores": [
      {
        "id": 1,
        "name": "Centro",
        "address": "Rua Principal, 123\nCentro, São Paulo - SP",
        "phone": "+55 11 98765-4321"
      }
    ],
    "schedule": [
      { "day": "Segunda", "hours": "10:00 - 20:00" },
      { "day": "Terça", "hours": "10:00 - 20:00" },
      { "day": "Quarta", "hours": "10:00 - 20:00" },
      { "day": "Quinta", "hours": "10:00 - 20:00" },
      { "day": "Sexta", "hours": "10:00 - 20:00" },
      { "day": "Sábado", "hours": "09:00 - 18:00" }
    ]
  },
  "contact": {
    "badge": "Fale Conosco",
    "title": {
      "before": "Agende seu Atendimento",
      "highlight": "Com Antecedência"
    },
    "form": {
      "fields": {
        "name": { "label": "Nome", "placeholder": "Seu nome completo" },
        "email": { "label": "E-mail", "placeholder": "seu@email.com" },
        "phone": { "label": "Telefone", "placeholder": "(11) 98765-4321" },
        "date": { "label": "Data e Horário", "placeholder": "DD/MM/AAAA HH:MM" },
        "message": { "label": "Mensagem", "placeholder": "Conte-nos sobre o serviço desejado" }
      },
      "terms": "Aceito os Termos e Condições",
      "submit": "Enviar Solicitação"
    }
  },
  "gallery": {
    "badge": "Nossa Galeria",
    "title": {
      "before": "Estilos Que",
      "highlight": "Fazem Diferença"
    },
    "images": [
      { "src": "https://images.unsplash.com/photo-1599351431202-1e0f0137899a?w=300&h=300&fit=crop", "alt": "Corte moderno 1" },
      { "src": "https://images.unsplash.com/photo-1621605815971-fbc98d665033?w=300&h=300&fit=crop", "alt": "Barba estilizada" },
      { "src": "https://images.unsplash.com/photo-1503951914875-452162b0f3f1?w=300&h=300&fit=crop", "alt": "Corte clássico" },
      { "src": "https://images.unsplash.com/photo-1585747860715-2ba37e788b70?w=300&h=300&fit=crop", "alt": "Penteado premium" },
      { "src": "https://images.unsplash.com/photo-1622287162716-f311baa1a2b8?w=300&h=300&fit=crop", "alt": "Barba e cabelo" },
      { "src": "https://images.unsplash.com/photo-1605497788044-5a32c7078486?w=300&h=300&fit=crop", "alt": "Corte degradê" },
      { "src": "https://images.unsplash.com/photo-1622286342621-4bd786c2447c?w=300&h=300&fit=crop", "alt": "Barba completa" },
      { "src": "https://images.unsplash.com/photo-1598520106830-8c45c2035460?w=300&h=300&fit=crop", "alt": "Corte moderno 2" },
      { "src": "https://images.unsplash.com/photo-1607779097040-26e80aa78e66?w=300&h=300&fit=crop", "alt": "Design de barba" }
    ]
  },
  "newsletter": {
    "badge": "Newsletter / Ofertas",
    "title": {
      "before": "Receba Descontos e Ofertas",
      "highlight": "Direto no seu E-mail"
    },
    "placeholder": "Digite seu e-mail",
    "button": "Inscrever-se"
  },
  "footer": {
    "about": {
      "logo": "Barber Shop",
      "text": "Apoiamos a missão de oferecer os melhores serviços através do desenvolvimento de técnicas modernas e atendimento focado em qualidade e experiência do cliente."
    },
    "links": {
      "company": {
        "title": "Empresa",
        "items": [
          { "text": "Sobre Nós", "href": "#sobre" },
          { "text": "Fale Conosco", "href": "#contato" },
          { "text": "Blog", "href": "#blog" },
          { "text": "Política de Privacidade", "href": "#privacidade" },
          { "text": "Termos de Serviço", "href": "#termos" }
        ]
      },
      "services": {
        "title": "Serviços",
        "items": [
          { "text": "Corte de Cabelo", "href": "#servicos" },
          { "text": "Barba", "href": "#servicos" },
          { "text": "Coloração", "href": "#servicos" },
          { "text": "Tratamentos", "href": "#servicos" }
        ]
      },
      "schedule": {
        "title": "Horários",
        "weekdays": "Seg - Sex: 10:00 - 20:00",
        "saturday": "Sábado: 09:00 - 18:00",
        "sunday": "Domingo: Fechado"
      },
      "social": {
        "title": "Redes Sociais",
        "items": [
          { "name": "Facebook", "url": "#facebook", "icon": "facebook" },
          { "name": "Instagram", "url": "#instagram", "icon": "instagram" },
          { "name": "Twitter", "url": "#twitter", "icon": "twitter" },
          { "name": "YouTube", "url": "#youtube", "icon": "youtube" }
        ]
      }
    },
    "copyright": "© 2025 Todos os direitos reservados. Barber Shop"
  }
})

const mobileMenuOpen = ref(false)

const handleSubmit = () => {
  alert('Formulário enviado! (Esta é uma demonstração)')
}

const handleNewsletterSubmit = () => {
  alert('Inscrito com sucesso! (Esta é uma demonstração)')
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700;900&display=swap');

body {
  font-family: 'Playfair Display', serif;
}

.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border-width: 0;
}

html {
  scroll-behavior: smooth;
}

/* Garantir que elementos não ultrapassem a largura da tela */
* {
  box-sizing: border-box;
}

/* Melhorar responsividade em dispositivos muito pequenos */
@media (max-width: 320px) {
  .text-5xl {
    font-size: 2.5rem;
  }
  
  .text-4xl {
    font-size: 2rem;
  }
  
  /* Ajustar logo em telas muito pequenas */
  .text-2xl {
    font-size: 1.5rem;
  }
}

/* Garantir que o header não quebre em telas pequenas */
@media (max-width: 480px) {
  nav {
    min-height: 60px;
  }
  
  /* Garantir que o botão mobile sempre seja visível */
  button[aria-label*="menu"] {
    min-width: 44px;
    min-height: 44px;
    display: flex;
    align-items: center;
    justify-content: center;
  }
}
</style>
