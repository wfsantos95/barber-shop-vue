import { ref } from 'vue'
import { supabase } from '../lib/supabase.js'

export function useSupabase() {
  const loading = ref(false)
  const error = ref(null)

  // Função para limpar erros
  const clearError = () => {
    error.value = null
  }

  // Buscar serviços
  const getServices = async () => {
    loading.value = true
    clearError()
    
    try {
      const { data, error: supabaseError } = await supabase
        .from('services')
        .select('*')
        .eq('active', true)
        .order('id')
      
      if (supabaseError) throw supabaseError
      return data
    } catch (err) {
      error.value = err.message
      return []
    } finally {
      loading.value = false
    }
  }

  // Buscar barbeiros
  const getBarbers = async () => {
    loading.value = true
    clearError()
    
    try {
      const { data, error: supabaseError } = await supabase
        .from('barbers')
        .select('*')
        .eq('active', true)
        .order('id')
      
      if (supabaseError) throw supabaseError
      return data
    } catch (err) {
      error.value = err.message
      return []
    } finally {
      loading.value = false
    }
  }

  // Criar agendamento
  const createAppointment = async (appointmentData) => {
    loading.value = true
    clearError()
    
    try {
      console.log('Dados do agendamento:', appointmentData)
      
      // Primeiro, criar ou buscar cliente
      const customerData = {
        name: appointmentData.name,
        email: appointmentData.email,
        phone: appointmentData.phone
      }
      
      console.log('Inserindo cliente:', customerData)
      
      const { data: customer, error: customerError } = await supabase
        .from('customers')
        .upsert(customerData, {
          onConflict: 'email'
        })
        .select()
        .single()
      
      console.log('Resultado cliente:', { customer, customerError })
      
      if (customerError) throw customerError

      // Criar agendamento
      const appointmentPayload = {
        customer_id: customer.id,
        barber_id: appointmentData.barber_id,
        service_id: appointmentData.service_id,
        appointment_date: appointmentData.date,
        appointment_time: appointmentData.time,
        notes: appointmentData.message || null
      }
      
      console.log('Inserindo agendamento:', appointmentPayload)
      
      // Validar dados obrigatórios
      if (!appointmentPayload.appointment_date) {
        throw new Error('Data do agendamento é obrigatória')
      }
      
      if (!appointmentPayload.appointment_time) {
        throw new Error('Horário do agendamento é obrigatório')
      }
      
      const { data, error: appointmentError } = await supabase
        .from('appointments')
        .insert(appointmentPayload)
        .select()
        .single()
      
      console.log('Resultado agendamento:', { data, appointmentError })
      
      if (appointmentError) throw appointmentError
      return data
    } catch (err) {
      error.value = err.message
      throw err
    } finally {
      loading.value = false
    }
  }

  // Inscrever na newsletter
  const subscribeNewsletter = async (email) => {
    loading.value = true
    clearError()
    
    try {
      const { data, error: supabaseError } = await supabase
        .from('newsletter_subscribers')
        .insert({ email })
        .select()
        .single()
      
      if (supabaseError) throw supabaseError
      return data
    } catch (err) {
      error.value = err.message
      throw err
    } finally {
      loading.value = false
    }
  }

  // Verificar disponibilidade de horário
  const checkAvailability = async (barberId, date, time) => {
    loading.value = true
    clearError()
    
    try {
      const { data, error: supabaseError } = await supabase
        .from('appointments')
        .select('id')
        .eq('barber_id', barberId)
        .eq('appointment_date', date)
        .eq('appointment_time', time)
        .neq('status', 'cancelled')
      
      if (supabaseError) throw supabaseError
      return data.length === 0 // true se disponível
    } catch (err) {
      error.value = err.message
      return false
    } finally {
      loading.value = false
    }
  }

  return {
    loading,
    error,
    clearError,
    getServices,
    getBarbers,
    createAppointment,
    subscribeNewsletter,
    checkAvailability
  }
}
