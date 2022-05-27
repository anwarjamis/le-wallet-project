movements = Movement.all
movements.each do |movement|
  if movement.description.include?("est") || movement.description.include?("Est")
    movement.description = "Uber"
    movement.save
  end

  if movement.description.include?("et") || movement.description.include?("Et")
    movement.description = "Supermercados Patito"
    movement.save
  end

  if movement.description.include?("qui") || movement.description.include?("Qui")
    movement.description = "Transferencia: Anwar Jamis"
    movement.save
  end

  if movement.description.include?("aut") || movement.description.include?("Aut")
    movement.description = "Farmacias Iben"
    movement.save
  end

  if movement.description.include?("voluptas") || movement.description.include?("Voluptas")
    movement.description = "Falabella Retail"
    movement.save
  end

  if movement.description.include?("eos") || movement.description.include?("Eos")
    movement.description = "Entradas CD Palestino"
    movement.save
  end
end
