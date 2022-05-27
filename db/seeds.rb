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

  if movement.description.include?("ut") || movement.description.include?("Ut")
    movement.description = "Web MercadoPago"
    movement.save
  end

  if movement.description.include?("id") || movement.description.include?("Id")
    movement.description = "Asesorías Benja"
    movement.save
  end

  if movement.description.include?("quo") || movement.description.include?("Quo")
    movement.description = "Tickets Naty"
    movement.save
  end

  if movement.description.include?("iure") || movement.description.include?("Iure")
    movement.description = "Los Piures Pichilemu"
    movement.save
  end

  if movement.description.include?("neque") || movement.description.include?("Neque")
    movement.description = "The North Face Costanera Center"
    movement.save
  end

  if movement.description.include?("rerum") || movement.description.include?("Rerum")
    movement.description = "Transferencia bootcamp Le Wagon"
    movement.save
  end
end
