-- Script para corrigir políticas RLS
-- Execute este script no SQL Editor do Supabase

-- Remover políticas existentes
DROP POLICY IF EXISTS "Allow insert customers" ON customers;
DROP POLICY IF EXISTS "Allow insert appointments" ON appointments;
DROP POLICY IF EXISTS "Allow insert newsletter" ON newsletter_subscribers;
DROP POLICY IF EXISTS "Allow read services" ON services;
DROP POLICY IF EXISTS "Allow read barbers" ON barbers;

-- Políticas corrigidas para customers
CREATE POLICY "Enable insert for customers" ON customers FOR INSERT WITH CHECK (true);
CREATE POLICY "Enable select for customers" ON customers FOR SELECT USING (true);
CREATE POLICY "Enable update for customers" ON customers FOR UPDATE USING (true);

-- Políticas corrigidas para appointments
CREATE POLICY "Enable insert for appointments" ON appointments FOR INSERT WITH CHECK (true);
CREATE POLICY "Enable select for appointments" ON appointments FOR SELECT USING (true);
CREATE POLICY "Enable update for appointments" ON appointments FOR UPDATE USING (true);

-- Políticas corrigidas para newsletter
CREATE POLICY "Enable insert for newsletter" ON newsletter_subscribers FOR INSERT WITH CHECK (true);
CREATE POLICY "Enable select for newsletter" ON newsletter_subscribers FOR SELECT USING (true);

-- Políticas para leitura pública de serviços e barbeiros
CREATE POLICY "Enable read for services" ON services FOR SELECT USING (active = true);
CREATE POLICY "Enable read for barbers" ON barbers FOR SELECT USING (active = true);
