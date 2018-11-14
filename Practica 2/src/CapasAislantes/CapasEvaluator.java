package CapasAislantes;

import java.util.ArrayList;

import org.opt4j.core.Objectives;
import org.opt4j.core.Objective.Sign;
import org.opt4j.core.problem.Evaluator;

import CapasAislantes.Data;

public class CapasEvaluator implements Evaluator<ArrayList<Integer>>{

	@SuppressWarnings("static-access")
	@Override
	public Objectives evaluate(ArrayList<Integer> fenotipo) {
		// TODO Auto-generated method stub
		int resultado = 0;
		Data d = new Data();
		for (int i = 0; i<fenotipo.size()-1;++i) {
			resultado += d.matriz[fenotipo.get(i)][fenotipo.get(i+1)];
		}
		Objectives objetivo = new Objectives();
		objetivo.add("Valor Aislante Maximo", Sign.MAX ,resultado);
		
		return objetivo;
	}

}
