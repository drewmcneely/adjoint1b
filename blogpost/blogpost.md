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

If you are familiar with Kleisli categories, you might have uncovered $\mathbf{MultSet}$ from above as the Kleisli category of the normalized [powerset monad](https://math.stackexchange.com/questions/2994993/the-powerset-monad). <!-- $P$: it's objects are sets $X, Y$, its's morphisms are functions $f : X \to PY = \{ U \subseteq X \} $ --> In fact, it turns out that many Markov categories of interest arise as Kleisli categories of so-called *probability monads*, <!-- (see [this paper on representable Markov categories](https://arxiv.org/abs/2010.07416v3) for details),--> such as the *Giry monad*, *Radon monad*, or *distribution monads over semirings*. Rather than explaining (technical) details of these, we want to dive into the underlying construction.

If you do *not* know Kleisli categories--don't worry, we'll try to explain the relevant properties on the go. 

A Kleisli category is, in short, a category $\mathbf{C}$ together with a wide subcategory $\iota: \mathbf{C}_{det} \subset \mathbf{C}$ (`wide' means 'identity on objects') having a right adjoint: $\iota \dashv P$: we have a natural[^1] isomorphism

[^1]: natural between functors $\mathbf{C}_{det} \times \mathbf{C} \to \mathbf{Set}$, i.e. considering $\mathbf{C}_{det}$-morphisms as left input and $\mathbf{C}$-morphisms on the right.

$$\mathbf{C}(X,Y) \cong \mathbf{C}_{det}(X, PY)$$

If you have heard about Kleisli categories and are wondering 'where is the monad?!' --It's $P \iota : \mathbf{C}_{det} \to \mathbf{C}_{det}$ (with multiplication and unit, a.k.a flatten and dirac, induced by the adjunction).

**TODO:  explain that the object $PY$ is called "distribution object"?**

The subcategory $\mathbf{C}_{det}$ is called 'deterministic', as their morphisms are interpreted as 'deterministic processes'. We'll define the term later in detail, but call upon your intuition for now: a deterministic process has one (or multiple) output(s) being definitely determined by their input(s) (which may in fact be empty). In a sense, determenistic processes behave like functions (as in our first example) -- **TODO** -- or measurable functions (in our second). More generally speaking, the (sub)category of deterministic processes $\mathbf{C}_{det}$ is a *cartesian monoidal* category:

 1. it has a terminal object $I$:  every object $X$ has a unique *deleting process* $del_X : X \to I$. 

 3. it has products $X \times Y$ and projection pairs $X \xleftarrow{\pi_L} X \times Y \xrightarrow{\pi_R} Y$ satisfying the [universal property of the product](https://en.wikipedia.org/wiki/Product_(category_theory)). 

You probably know that these properties together induce a symmetric monoidal structure with tensored $\mathbf{C}_{det}$-morphisms, as indicated in **TODO: diagram**.

As explained above, (**TODO: Check** ) we want to model stochastic process in a process-oriented manner. But how to integrate the tensor structure from $\mathbf{C}_{det}$ to $\mathbf{C}$? We need help of *zipper functions* in $\mathbf{C}_{det}$
$$\nabla_{X,Y} : PX \times PY \to P(X \times Y)$$ 
being compatible with the product on $\mathbf{C}_{det}$ and the adjunction $\iota \dashv P$.[^2]  

[^2]:  to be precise, we require  $\nabla_{X,Y}$ to make $P \iota : \mathbf{C}_{det} \to \mathbf{C}_{det}$ a symmetric monoidal functor, such that multiplication and unit of the monad are monoidal natural transformations. 
We are still wondering, though, what this exactly means for our characterization of Kleisli categories as left adjoint wide inclusions $P \vdash \iota : \mathbf{C}_{det} \subset \mathbf{C}$.

Using the natural bijection $\mathbf{C}(X,Y) \cong \mathbf{C}_{det}(X, PY)$ from above, we say that morphisms $f \in \mathbf{C} (A, X)$ and $g \in \mathbf{C} (B, Y)$ are represented by deterministic $f_{det} \in \mathbf{C}_{det}(A, PX)$ and $g_{det} \in \mathbf{C}_{det}(B, PY)$, respectively. Their tensor product is then defined by its representant $$(f \otimes g)_{det} : A \times B \xrightarrow{f_{det} \times g_{det}} PX \times PY \xrightarrow{\nabla_{X,Y}} P(X \times Y).$$
In the examples from above, the zipper is given as ... **TODO**..., yielding symmetric monoidal categories ... **TODO**.

These examples are symmetric monoidal categories, but not cartesian monoidal: they do have products.

However, they satisfy point 1: the tensor unit $I$ is still terminal not only in $\mathbf{C}_{det}$, but also in $\mathbf{C}$. 

This property is important for Markov categories, as it allows for *weakened* products: every pair of morphisms $f \in \mathbf{C}( A, X)$ and $g \in \mathbf{C}(A, Y)$, gives rise to *at least* one morphisms making the product diagram commute, namely
$$A \xrightarrow{\iota \langle id_A, id_A \rangle} A \times A \xrightarrow{f \otimes g} X \times Y$$,
**TODO: should we explain this?**
where $\langle id_A, id_A \rangle \in \mathbf{C}_{det}(A, A \times A)$ is the "diagonal map" induced by the universal property. It will be called copy-map from now on, as it is given as ... **TODO** in our example categories ... **TODO**

These *weak products* are no categorical products, as they lack the uniqueness constraint.
<!-- a property we are used to in $\mathbf{Set}$, which does not hold, though in the Kleisli category $\mathbf{SetMulti}$ **TODO: name**, -->
Here is a (counter)example: **TODO**

From a probability theoretic words, this states that morphisms of the form $h: A \to X \times Y$ can in general not be recovered from their so-called marginalizations $\pi_L \circ f : A \to X$ and $\pi_R \circ f : A \to Y$, as the product space $X \times Y$ incorporates more "uncertainty" than its individual factors. (This stems back from $\nabla_{X,Y} : PX \times PY \to P(X \times Y)$ *not*  being isomorphic: recall that $PX$ is a "distribution object" describing the amount of different states on $X$.)
 




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
