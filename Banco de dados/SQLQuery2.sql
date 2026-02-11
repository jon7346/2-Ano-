
-- =============================================
CREATE PROCEDURE  sp_ReajusteSalarial
 --@Aumento decimal(7,4)
   @Administrativo decimal(7,4), 
   @Financeiro decimal(7,4),
   @Operacional decimal(7,4)
AS
BEGIN
	--DECLARE @Aumento decimal(7,4) = 0.05

	UPDATE Funcionarios SET Salario_Base = (Salario_Base + (Salario_Base + @Administrativo)),Data_Ultimo_Reajuste = CONVERT(date, GETDATE()) where Area_Atuacao = 'Adiministrativo';
	
	UPDATE Funcionarios SET Salario_Base = (Salario_Base + (Salario_Base + @Administrativo)),Data_Ultimo_Reajuste = CONVERT(date, GETDATE()) where Area_Atuacao = 'Financeiro';
	
	UPDATE Funcionarios SET Salario_Base = (Salario_Base + (Salario_Base + @Administrativo)),Data_Ultimo_Reajuste = CONVERT(date, GETDATE()) where Area_Atuacao = 'Operação';

END
GO
