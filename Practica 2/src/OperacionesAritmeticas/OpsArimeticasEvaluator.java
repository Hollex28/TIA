package OperacionesAritmeticas;
import java.util.*;

import org.opt4j.core.Objective.Sign;
import org.opt4j.core.Objectives;
import org.opt4j.core.problem.Evaluator;

public class OpsArimeticasEvaluator implements Evaluator<ArrayList<MathematicalSymbol>> {

	@Override
	public Objectives evaluate (ArrayList<MathematicalSymbol> phenotype) {
		
		int resultado = Data.numeros[0];
		//variable añadida para la modificacion modificacion multiobjetivo
		int numSUM =0;
		for (int i = 0; i < phenotype.size();++i ) {
			switch (phenotype.get(i)) {
			case PLUS: resultado += Data.numeros[i+1];
			break;
			case MINUS: resultado -= Data.numeros[i+1];
			break;
			case MULTIPLICATION: resultado *= Data.numeros[i+1];
			break;
			case DIVISION: resultado /= Data.numeros[i+1];
			break;
			}
		}
		// si hay un indivisuo que no cumpla con ciertas restricciones le ponemos el valos de fitness indeseado
		// queremos mininizar la diferencia entre el resultado objetivo y el evaluado
		
		Objectives objetives = new Objectives();
		objetives.add("Valor objetivo-MIN", Sign.MIN ,Math.abs(Data.resultadoObjetivo - resultado));
		// Modificacion para funcion multiobjetivo para maximizar el +
		objetives.add("Cuenta de +", Sign.MAX, numSUM);
		return objetives;
		
	}
}
