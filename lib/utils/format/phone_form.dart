class PhoneFormatter {
  static String formatPhone(String phone) {
    // Verifica se o telefone é nulo ou vazio
    if (phone == null || phone.isEmpty) return "Não informado";

    // Remove todos os caracteres não numéricos
    phone = phone.replaceAll(RegExp(r'\D'), '');
    print("Telefone recebido: $phone (length: ${phone.length})"); // Debug

    // Se começa com "55" e tem 13 dígitos, remove o "55"
    if (phone.startsWith("55") && phone.length == 13) {
      phone = phone.substring(2); // Resultado: 11 dígitos
    }

    // Aplica a formatação com base no comprimento
    if (phone.length == 11) {
      return '+55 (${phone.substring(0, 2)}) ${phone.substring(2, 7)}-${phone.substring(7)}';
    } else if (phone.length == 10) {
      return '+55 (${phone.substring(0, 2)}) ${phone.substring(2, 6)}-${phone.substring(6)}';
    } else if (phone.length == 9) {
      return '${phone.substring(0, 5)}-${phone.substring(5)}';
    } else if (phone.length == 8) {
      return '${phone.substring(0, 4)}-${phone.substring(4)}';
    }

    print("Telefone não formatado: $phone"); // Debug
    return phone;
  }
}