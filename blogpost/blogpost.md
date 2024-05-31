Adjoint School 2024 Subgroup 1B Blogpost

Drew, Nico, and Utku

# Introduction (this probably doesn't need a section title)

We assume that the reader is familiar with symmetric monoidal categories and string diagrams. All of our string diagrams are to be read bottom to top.

* As said by Tomas, spell out the motivation here, and make sure readers know that there's a big reward at the end.
* Maybe an illustration? My motivator to learn this was the difference between the cumbersome algebra from my professor's notes (Section 9.4 of the attached estimation theory pdf) vs the simplicity of [Proposition 3.7 in this paper](https://arxiv.org/pdf/2401.14669)

# Basics of Probability Theory (UTKU)

Establish an example setting:

Weather, lawn sprinklers, and other

W = {Sunny, Cloudy, Rainy}
S = {On, Off}
P = {High, Low}
T = {Hot, Mild, Cold}

* Distributions
    * Show probability and possibility distributions in our example setting
    * Use bra-ket notation from example 2.4 in [this paper](https://arxiv.org/pdf/1709.00322)
* Markov Kernels
    * Probability and possibility
    * Show that these are Kleisli maps, segue into next section

# Kleisli Categories 
<!--
(Should this be a subsection of above? I think not) (NICO)
-->

If you are familiar with Kleisli categories, you might have uncovered $\mathbf{MultSet}$ from above as the Kleisli category of the [powerset monad](https://math.stackexchange.com/questions/2994993/the-powerset-monad).
<!---
$P$: it's objects are sets $X, Y$, its's morphisms are functions $f : X \to PY = \{ U \subseteq X \} $
--->
In fact, it turns out that most Markov categories of interest arise as Kleisli categories of. (See the [this paper on representable Markov categories](https://arxiv.org/abs/2010.07416v3) for details).

If you do *not* know Kleisli categories--don't worry, we'll try to explain the relevant properties on the go. 

A Kleisly category is, in short, a category $\mathbf{C}$ together with a wide subcategory $\iota: \mathbf{C}_{det} \subset \mathbf{C}$ (`wide' means 'identity on objects') having a right adjoint: $ \iota \dashv P $

If you have heard about Kleisli categories and are wondering `where is the monad?!` --It's $ P \iota : \mathbf{C} \to \mathbf{C} $ (with multiplication and unit, a.k.a flatten and dirac, induced by the adjunction).

The subcategory $\mathbf{C}_{det}$ is called 'deterministic', as their morphisms are interpreted as 'deterministic processes'. We'll define the term later in detail, but call upon your intuitio for now: a deterministic processs has one (or multiple) output(s) beeing definitely determined by their input(s) (which may in fact be empty). In a sense, determenistic processes behave like functions (as in our first example) -- **TODO** -- or measurable functions (in our second). More generally speaking, the (sub)category of deterministic processes $\mathbf{C}_{det}$ is a *cartesian monoidal* category:
- it has a terminal object $I$
- it has products $X \times Y$ and projection pairs $X \xleftarrow{out_L} X \times Y \xrightarrow{out_R}$ satisfying the [universal property of the product](https://en.wikipedia.org/wiki/Product_(category_theory)). **TODO: include diagram**

The first property yields a unique *deleting process* $del_X : X \to I$ for every object $X$. The universal propoerty induces the product functor $\times : \mathbf{C} \times \mathbf{C} \to \mathbf{C}$ mapping morphisms $f, g$ to the unique dashed arrow in **TODO: include diagram**

This matches our interpretation of the $\mathbf{C}$-morphisms as processes, which can not only be *composed* (in a time-like manner) but also *tensored* (i.e. run independently in parallel).





- example: $\mathbf{MultSet}_{det}=\mathbf{Set}$.


* Example probability monads (Construct `flatten`, `dirac`, and `zipper` for each)
    * Finite distribution monad
    * Powerset monad
    * Briefly mention giry monad
* Kleisli categories
    * What structures do the Kleisli categories lose (and what do they keep) from their base (Cartesian) counterparts?
        * They do keep comonoid structures
        * But they're no longer Cartesian
        * Copy map is no longer natural
        * Products are no longer categorical products, ie. projections are no longer universal. What does this mean in terms of probability? (Answer: unlike Cartesian projection, you cannot in general reconstruct a joint probability distribution from its marginals)
        * Delete is still natural though, ie. unit object is still final
        * This all plays into "equivalent characterizations of deterministic Markov categories"

# Markov Categories

## Formal definition

Let's start with the terse definition that category theorists love so much: A Markov category is a semiCartesian category where every object is a comonoid compatible with the monoidal structure.

(Now give a more explicit definition. Should we give both string diagram equations and commutative diagrams? Or just stick to one?)

## Each Axiom Explained

Let's go a little bit more in-depth into why each of these axioms are required.
(Bring in our established example setting into each of the subsections below.)

### Composition and Identity (Utku)

We want to describe how to "push forward" distributions

### Monoidal Products (Nico)

We want to describe distributions over joint variables.

### Swap Map (Drew)

### Copy Map (Drew)

We want this because it makes sense to process the same data in multiple different ways and then compare them.
Show for instance the "graph" of a morphism

Why should this be compatible with the monoidal structure?

### Delete Map (Nico)

In probability theory: marginalization.
In information processing:deleting information seems desirable (even though impossible in quantum information theory)

Why should it be natural? Equivalently, why should the tensor unit be terminal?
In this sense, why should del be compatible with the monoidal structure?

* This corresponds to normalization
* Deleting an output of a process deletes the whole process
* Omitting this leads to CD-categories

## Important Markov categories

* The most important construction: Kleisli categories of symmetric monoidal monads
* FinSupStoch := Kl(D)
* Finstoch
* Gauss

## Additional Axioms and definitions (Drew)

### Independence
### Conditionals, Bayesian Inversion
### Determinism
### Almost-sure equality
### Representability?

# Conclusion: Cool things you can do with Markov categories

* De Finetti
* HMMs and Bayesian Inversion
* Causal Inferencing
