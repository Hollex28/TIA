package CapasAislantes;

import java.util.Arrays;
import java.util.Random;
import org.opt4j.core.genotype.PermutationGenotype;
import org.opt4j.core.problem.Creator;

public class CapasCreator implements Creator<PermutationGenotype<Integer>> {

	@Override
	public PermutationGenotype<Integer> create() {
		PermutationGenotype<Integer> genotipo = new PermutationGenotype<Integer>(Arrays.asList(Data.capas));
		genotipo.init(new Random());
		
		return genotipo;
	}

}
