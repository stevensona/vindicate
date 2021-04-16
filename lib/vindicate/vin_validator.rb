class VinValidator < ActiveModel::EachValidator
  VALID_CHARS = /[A-HJ-NPR-Z0-9]{17}/i

  def validate_each(record, attribute, value)
    return if value.blank?
    unless value.respond_to?(:length)
      record.errors.add(attribute, :invalid, message: 'is invalid')
      return
    end
    if value.length < 17
      record.errors.add(attribute, :invalid, message: 'is too short')
      return
    end
    if value.length > 17
      record.errors.add(attribute, :invalid, message: 'is too long')
      return
    end
    unless value =~ VALID_CHARS
      record.errors.add(attribute, :invalid, message: 'contains invalid characters')
      return
    end
    record.errors.add(attribute, :invalid, message: 'is invalid') unless valid?(value)
  end

  private

  def transliterate(c)
    '0123456789.ABCDEFGH..JKLMN.P.R..STUVWXYZ'.chars.find_index(c) % 10
  end

  def calculate_check_digit(vin)
    map = '0123456789X'.split('')
    weights = '8765432X098765432'
    sum = vin.split('').each_with_index.reduce(0) do |m, (c, i)|
      m + transliterate(c) * map.find_index(weights[i])
    end
    map[sum % 11]
  end

  def valid?(vin)
    calculate_check_digit(vin) == vin[8]
  end

end
