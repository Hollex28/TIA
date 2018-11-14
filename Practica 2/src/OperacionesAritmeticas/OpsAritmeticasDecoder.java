package OperacionesAritmeticas;
import java.util.*;

import org.opt4j.core.genotype.SelectGenotype;
import org.opt4j.core.problem.Decoder;

public class OpsAritmeticasDecoder implements Decoder<SelectGenotype<MathematicalSymbol>,ArrayList<MathematicalSymbol>> {

	@Override
	public ArrayList<MathematicalSymbol> decode(SelectGenotype<MathematicalSymbol> genotype) {
		
		ArrayList<MathematicalSymbol> phenotype = new ArrayList<MathematicalSymbol>();
		for (int i = 0; i < genotype.size(); i++ ) {
			phenotype.add(genotype.getValue(i));
		}
		
		return phenotype;
	}
	
	
	

}
