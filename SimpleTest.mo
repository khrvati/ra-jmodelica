model SimpleTest
  Real vbat(start = 22), vmot1, vmot2;
  Real ibat, imot1, imot2;
  Real wmot1, wmot2, tmot1, tmot2;
  Real treq1, treq2;
  parameter Real I = 1;
  parameter Real t_target = 10;
  parameter Real p_mot = 100;
equation
  der(wmot1) * I = tmot1;
  der(wmot2) * I = tmot2;
  vbat = 22 - ibat * 0.5;
  ibat = imot1 + imot2;
  vbat = vmot1;
  vbat = vmot2;
  imot1 * vmot1 = wmot1 * tmot1;
  imot2 * vmot2 = wmot2 * tmot2;
  if wmot1 <= Modelica.Constants.eps then
    treq1 = 30;
  else
    treq1 = min(30, p_mot / wmot1);
  end if;
  if wmot2 <= Modelica.Constants.eps then
    treq2 = 30;
  else
    treq2 = min(30, p_mot / wmot2);
  end if;
  tmot1 = treq1;
  tmot2 = treq2;
end SimpleTest;
