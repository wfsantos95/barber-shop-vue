-- Estrutura do banco de dados para Seven Barber Shop

-- Tabela de serviços
CREATE TABLE IF NOT EXISTS services (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  duration_minutes INTEGER NOT NULL DEFAULT 30,
  description TEXT,
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de barbeiros/profissionais
CREATE TABLE IF NOT EXISTS barbers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  role VARCHAR(100),
  image_url TEXT,
  active BOOLEAN DEFAULT true,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de clientes
CREATE TABLE IF NOT EXISTS customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  phone VARCHAR(20),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Tabela de agendamentos
CREATE TABLE IF NOT EXISTS appointments (
  id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(id),
  barber_id INTEGER REFERENCES barbers(id),
  service_id INTEGER REFERENCES services(id),
  appointment_date DATE NOT NULL,
  appointment_time TIME NOT NULL,
  status VARCHAR(20) DEFAULT 'pending', -- pending, confirmed, completed, cancelled
  notes TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  
  -- Evitar agendamentos duplicados no mesmo horário para o mesmo barbeiro
  UNIQUE(barber_id, appointment_date, appointment_time)
);

-- Tabela de newsletter
CREATE TABLE IF NOT EXISTS newsletter_subscribers (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  subscribed_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  active BOOLEAN DEFAULT true
);

-- Inserir dados iniciais dos serviços
INSERT INTO services (name, price, duration_minutes, description) VALUES
('Corte de Cabelo', 45.00, 45, 'Corte moderno e estilizado'),
('Barba', 35.00, 30, 'Aparar e modelar barba'),
('Cuidados com a Pele', 60.00, 60, 'Tratamento facial completo'),
('Coloração', 80.00, 90, 'Coloração e tintura capilar'),
('Aparar', 25.00, 20, 'Aparar cabelo e barba'),
('Barba Completa', 50.00, 45, 'Barba completa com acabamento')
ON CONFLICT DO NOTHING;

-- Inserir dados iniciais dos barbeiros
INSERT INTO barbers (name, role, image_url) VALUES
('Carlos Silva', 'Barbeiro Especialista', 'https://images.unsplash.com/photo-1703792685152-d13e206924d8?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1974'),
('Ana Paula', 'Hair Stylist', 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400&h=400&fit=crop'),
('João Santos', 'Barbeiro Senior', 'https://images.unsplash.com/photo-1703792684940-a05aa0f1188f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=687'),
('Pedro Costa', 'Barbeiro Senior', 'https://images.unsplash.com/photo-1635273051937-a0ddef9573b6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=687'),
('Douglas Almeida', 'Barbeiro Senior', 'https://images.unsplash.com/photo-1622287162716-f311baa1a2b8?w=600&h=400&fit=crop')
ON CONFLICT DO NOTHING;

-- Políticas RLS (Row Level Security)
ALTER TABLE customers ENABLE ROW LEVEL SECURITY;
ALTER TABLE appointments ENABLE ROW LEVEL SECURITY;
ALTER TABLE newsletter_subscribers ENABLE ROW LEVEL SECURITY;

-- Remover políticas existentes se houver
DROP POLICY IF EXISTS "Allow insert customers" ON customers;
DROP POLICY IF EXISTS "Allow insert appointments" ON appointments;
DROP POLICY IF EXISTS "Allow insert newsletter" ON newsletter_subscribers;
DROP POLICY IF EXISTS "Allow read services" ON services;
DROP POLICY IF EXISTS "Allow read barbers" ON barbers;

-- Políticas para customers
CREATE POLICY "Enable insert for customers" ON customers FOR INSERT WITH CHECK (true);
CREATE POLICY "Enable select for customers" ON customers FOR SELECT USING (true);
CREATE POLICY "Enable update for customers" ON customers FOR UPDATE USING (true);

-- Políticas para appointments
CREATE POLICY "Enable insert for appointments" ON appointments FOR INSERT WITH CHECK (true);
CREATE POLICY "Enable select for appointments" ON appointments FOR SELECT USING (true);
CREATE POLICY "Enable update for appointments" ON appointments FOR UPDATE USING (true);

-- Políticas para newsletter
CREATE POLICY "Enable insert for newsletter" ON newsletter_subscribers FOR INSERT WITH CHECK (true);
CREATE POLICY "Enable select for newsletter" ON newsletter_subscribers FOR SELECT USING (true);

-- Políticas para leitura pública de serviços e barbeiros
CREATE POLICY "Enable read for services" ON services FOR SELECT USING (active = true);
CREATE POLICY "Enable read for barbers" ON barbers FOR SELECT USING (active = true);
