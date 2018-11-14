package OperacionesAritmeticas;
import java.util.Random;
import org.opt4j.core.genotype.SelectGenotype;
import org.opt4j.core.problem.Creator;

public class OpsAritmeticasCreator implements Creator<SelectGenotype<MathematicalSymbol>>{

	@Override
	public SelectGenotype<MathematicalSymbol> create() {
		
		MathematicalSymbol[] Symbols = {MathematicalSymbol.PLUS,
		MathematicalSymbol.MINUS, MathematicalSymbol.MULTIPLICATION,
		MathematicalSymbol.DIVISION};
		SelectGenotype<MathematicalSymbol> genotype = new SelectGenotype<MathematicalSymbol>(Symbols);
		//El genotipo estaria formado por numeroSimbolos matematicos elegidos al azar
		//en nuestro caso la poblacion sera un conjunto de individuos
		genotype.init(new Random(), Data.numeroSimbolos);
		return genotype;
		
	}

}
