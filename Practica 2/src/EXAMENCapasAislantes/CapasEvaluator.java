package EXAMENCapasAislantes;

import java.util.ArrayList;

import org.opt4j.core.Objectives;
import org.opt4j.core.Objective.Sign;
import org.opt4j.core.problem.Evaluator;


public class CapasEvaluator implements Evaluator<ArrayList<Integer>>{

	@SuppressWarnings("static-access")
	@Override
	public Objectives evaluate(ArrayList<Integer> fenotipo) {
		// TODO Auto-generated method stub
		double resultado = 0;
		double coste = 100;
		Data d = new Data();
		for (int i = 0; i<fenotipo.size()-1;++i) {
			if(fenotipo.get(0)==1 | fenotipo.get(0)==2 | fenotipo.get(0)==3) {
				coste = 120;
			}
			if(fenotipo.get(0)==4 | fenotipo.get(0)==5 | fenotipo.get(0)==6) {
				coste = 150;
			}
			resultado += d.matriz[fenotipo.get(i)][fenotipo.get(i+1)];
			/*AÑADIDO PA EXAMEN*/
			if(i>0 && fenotipo.get(i-1) == 0 && fenotipo.get(i) == 1 && (fenotipo.get(i+1) == 3 | fenotipo.get(i+1)== 4 )) {
				resultado = (resultado + (resultado * 0.2));
			}
			if(i>0 && fenotipo.get(i-1) == 5 && fenotipo.get(i) == 7 && (fenotipo.get(i+1) == 8 | fenotipo.get(i+1)== 9 )) {
				resultado *= 0;
			}
			/*FIN AÑADIDO PA EXAMEN*/
		}
		Objectives objetivo = new Objectives();
		objetivo.add("Valor Aislante Maximo", Sign.MAX ,resultado);
		objetivo.add("Coste  maximo", Sign.MIN ,coste);
		
		return objetivo;
	}

}
