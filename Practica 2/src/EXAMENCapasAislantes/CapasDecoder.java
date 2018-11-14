package EXAMENCapasAislantes;

import java.util.ArrayList;

import org.opt4j.core.genotype.PermutationGenotype;
import org.opt4j.core.problem.Decoder;

public class CapasDecoder implements Decoder<PermutationGenotype<Integer>,ArrayList<Integer>> {

	@Override
	public ArrayList<Integer> decode(PermutationGenotype<Integer> genotipo) {
		// TODO Auto-generated method stub
		ArrayList<Integer> phenotype = new ArrayList<Integer>();
		for (int i = 0; i < genotipo.size(); i++ ) {
			phenotype.add(genotipo.get(i));
		}
		return phenotype;
	}

}
